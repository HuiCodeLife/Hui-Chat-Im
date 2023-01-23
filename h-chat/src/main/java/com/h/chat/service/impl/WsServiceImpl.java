package com.h.chat.service.impl;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.h.chat.config.Constants;
import com.h.chat.domain.ChatMsg;
import com.h.chat.domain.ChatMsgDto;
import com.h.chat.domain.MsgResult;
import com.h.chat.domain.MsgStatus;
import com.h.chat.service.ChatMsgService;
import com.h.chat.service.ChatUserFriendsService;
import com.h.chat.service.WsService;
import com.h.chat.utils.RobotUtil;
import com.h.common.core.domain.AjaxResult;
import com.h.common.core.domain.entity.SysUser;
import com.h.common.core.domain.model.LoginUser;
import com.h.common.utils.SecurityUtils;
import com.h.system.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.user.SimpUser;
import org.springframework.messaging.simp.user.SimpUserRegistry;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author: Lin
 * @since: 2023-01-11
 */
@Service
@Slf4j
public class WsServiceImpl implements WsService {
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    @Autowired
    private ChatMsgService chatMsgService;

    @Autowired
    private ChatUserFriendsService chatUserFriendsService;

    @Autowired
    SimpUserRegistry simpUserRegistry;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    @Autowired
    private ISysUserService userService;

    @Transactional(rollbackFor = Exception.class)
    public void send2User(Authentication authentication, ChatMsgDto chatMsgDto) {
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        SysUser user = loginUser.getUser();
        MsgResult wsResult = new MsgResult();
        if (StrUtil.isBlank(chatMsgDto.getContent())) {
            wsResult.put("code", MsgStatus.MESSAGE_NULL);
            wsResult.put("data", "消息内容不能为空");
            simpMessagingTemplate.convertAndSendToUser(user.getUserName(), "/queue/chat", wsResult);
            throw new RuntimeException("消息内容不能为空");
        }
        if (StrUtil.isBlank(chatMsgDto.getAcceptUserId()+"")) {
            wsResult.put("code", MsgStatus.MESSAGE_NULL);
            wsResult.put("data", "消息内容不能为空");
            simpMessagingTemplate.convertAndSendToUser(user.getUserName(), "/queue/chat", wsResult);
            throw new RuntimeException("接收者不能为空");
        }

        // 判断接收者是否为好友
        boolean friend = chatUserFriendsService.isFriend(user.getUserId(), chatMsgDto.getAcceptUserId());
        if (!friend) {
            // 接收者不是好友
            wsResult.put("code", MsgStatus.NOT_FRIENDS);
            wsResult.put("data", "接收者不是好友");
            simpMessagingTemplate.convertAndSendToUser(user.getUserName(), "/queue/chat", wsResult);
            throw new RuntimeException("接收者非好友");
        }
        SysUser toUser4Db = userService.selectUserById(chatMsgDto.getAcceptUserId());
        // 保存聊天记录 (未加密)
        chatMsgDto.setFrom(user.getUserName());
        chatMsgDto.setFromNickName(user.getNickName());
        chatMsgDto.setCreateTime(new Date());
        ChatMsg chatMsg = new ChatMsg();
        BeanUtil.copyProperties(chatMsgDto, chatMsg);
        chatMsg.setSendUserId(user.getUserId());
        chatMsgService.save(chatMsg);
        wsResult.put("code", MsgStatus.SUCCESS);
        wsResult.put("data", chatMsgDto);
        // 判断接收者是否在线
        chatMsgDto.setTo(toUser4Db.getUserName());
        SimpUser toUser = simpUserRegistry.getUser(chatMsgDto.getTo());
        if (toUser != null && StrUtil.isNotBlank(toUser.getName())) {
            log.info(" {}在线, {}发送的消息 已发送", chatMsgDto.getTo(), user.getUserName());
            simpMessagingTemplate.convertAndSendToUser(chatMsgDto.getTo(), "/queue/chat", wsResult);
            return;
        }
        // 用户不在线，将消息存入redis
        String listKey = Constants.REDIS_UNREAD_MSG_PREFIX + ":" + chatMsgDto.getTo() + ":/topic/reply";
        log.info(" {}不在线, {}发送的消息 {}将被存入redis", chatMsgDto.getTo(), user.getUserName(), chatMsgDto);
        // 存入redis，用户上线后主动拉去
        stringRedisTemplate.opsForList().rightPush(listKey, JSON.toJSONString(chatMsgDto));
    }

    @Transactional(rollbackFor = Exception.class)
    public void send2Robot(Authentication authentication, ChatMsgDto chatMsgDto) {
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        SysUser user = loginUser.getUser();
        // 获取机器人答复
        String result = RobotUtil.getRobotMsg(chatMsgDto, user);
        //构建返回消息JSON字符串
        chatMsgDto.setFrom("robot");
        chatMsgDto.setFromNickName("机器人");
        chatMsgDto.setCreateTime(new Date());
        chatMsgDto.setContent(result);
        chatMsgDto.setTo(user.getUserName());
        chatMsgDto.setAcceptUserId(user.getUserId());
        MsgResult wsResult = new MsgResult();
        wsResult.put("code", MsgStatus.SUCCESS);
        wsResult.put("data", chatMsgDto);
        simpMessagingTemplate.convertAndSendToUser(chatMsgDto.getTo(), "/queue/robot", wsResult);
    }

    @Override
    public AjaxResult pullUnreadMessage(String destination) {
        {
            try {
                //当前登录用户
                SysUser loginUser = SecurityUtils.getLoginUser().getUser();
                //存储消息的Redis列表名
                String listKey = Constants.REDIS_UNREAD_MSG_PREFIX + ":" + loginUser.getUserName() + ":" + destination;
                //从Redis中拉取所有未读消息
                List<String> messageList = stringRedisTemplate.opsForList().range(listKey, 0, -1);
                AjaxResult ajaxResult = AjaxResult.success();
                if(messageList !=null && messageList.size() > 0){
                    //删除Redis中的这个未读消息列表
                    stringRedisTemplate.delete(listKey);
                }
                ajaxResult.put("data", messageList);
                return ajaxResult;
            }catch (Exception e){
                AjaxResult ajaxResult = AjaxResult.error();
                ajaxResult.put("msg", e.getMessage());
                return ajaxResult;
            }
        }
    }

}
