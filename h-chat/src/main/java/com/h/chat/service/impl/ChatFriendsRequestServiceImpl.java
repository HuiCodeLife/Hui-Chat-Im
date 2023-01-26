package com.h.chat.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.h.chat.domain.*;
import com.h.chat.service.ChatUserFriendsService;
import com.h.common.core.domain.entity.SysUser;
import com.h.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import com.h.chat.mapper.ChatFriendsRequestMapper;
import com.h.chat.service.IChatFriendsRequestService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 好友请求Service业务层处理
 *
 * @author h
 */
@Service
public class ChatFriendsRequestServiceImpl extends ServiceImpl<ChatFriendsRequestMapper, ChatFriendsRequest> implements IChatFriendsRequestService
{
    @Autowired
    private ChatFriendsRequestMapper chatFriendsRequestMapper;

    @Autowired
    private ISysUserService userService;


    @Autowired
    private ChatUserFriendsService chatUserFriendsService;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    /**
     * 查询好友请求
     *
     * @param id 好友请求主键
     * @return 好友请求
     */
    @Override
    public ChatFriendsRequest selectChatFriendsRequestById(Long id)
    {
        return chatFriendsRequestMapper.selectChatFriendsRequestById(id);
    }

    /**
     * 查询好友请求列表
     *
     * @param chatFriendsRequest 好友请求
     * @return 好友请求
     */
    @Override
    public List<ChatFriendsRequest> selectChatFriendsRequestList(ChatFriendsRequest chatFriendsRequest)
    {
        return chatFriendsRequestMapper.selectChatFriendsRequestList(chatFriendsRequest);
    }

    /**
     * 新增好友请求
     *
     * @param chatFriendsRequest 好友请求
     * @return 结果
     */
    @Override
    public int insertChatFriendsRequest(ChatFriendsRequest chatFriendsRequest)
    {
        return chatFriendsRequestMapper.insertChatFriendsRequest(chatFriendsRequest);
    }

    /**
     * 修改好友请求
     *
     * @param chatFriendsRequest 好友请求
     * @return 结果
     */
    @Override
    public int updateChatFriendsRequest(ChatFriendsRequest chatFriendsRequest)
    {
        return chatFriendsRequestMapper.updateChatFriendsRequest(chatFriendsRequest);
    }

    /**
     * 批量删除好友请求
     *
     * @param ids 需要删除的好友请求主键
     * @return 结果
     */
    @Override
    public int deleteChatFriendsRequestByIds(Long[] ids)
    {
        return chatFriendsRequestMapper.deleteChatFriendsRequestByIds(ids);
    }

    /**
     * 删除好友请求信息
     *
     * @param id 好友请求主键
     * @return 结果
     */
    @Override
    public int deleteChatFriendsRequestById(Long id)
    {
        return chatFriendsRequestMapper.deleteChatFriendsRequestById(id);
    }

    @Override
    public List<RequestFriendsVo> selectFriendsRequest(Long userId) {
        LambdaQueryWrapper<ChatFriendsRequest> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ChatFriendsRequest::getAcceptUserId,userId);
        queryWrapper.eq(ChatFriendsRequest::getDelFlag,"0");
        queryWrapper.orderByDesc(ChatFriendsRequest::getRequestDateTime);
        List<ChatFriendsRequest> chatFriendsRequests = chatFriendsRequestMapper.selectList(queryWrapper);
        List<RequestFriendsVo> requestFriendsVos = new ArrayList<>();
        for (ChatFriendsRequest chatFriendsRequest : chatFriendsRequests) {
            RequestFriendsVo requestFriendsVo = new RequestFriendsVo();
            SysUser user = userService.selectUserById(chatFriendsRequest.getSendUserId());
            BeanUtils.copyProperties(user,requestFriendsVo);
            requestFriendsVo.setStatus(chatFriendsRequest.getStatus());
            requestFriendsVo.setRequestId(chatFriendsRequest.getId());
            requestFriendsVo.setRequestDataTime(chatFriendsRequest.getRequestDateTime());
            requestFriendsVos.add(requestFriendsVo);
        }
        return requestFriendsVos;
    }


    @Override
    public void addChatFriendsRequest(Long userId, Long acceptUserId) {
        // 判断是否添加自己
        if(userId.equals(acceptUserId)){
            throw new RuntimeException("不能添加自己为好友");
        }
        // 判断是否已经是好友了
        boolean isFriend = chatUserFriendsService.isFriend(userId, acceptUserId);
        if(isFriend){
            throw new RuntimeException("该好友已经是您的好友了");
        }
        SysUser acceptUser = userService.selectUserById(acceptUserId);
        if(Objects.isNull(acceptUser)){
            throw new RuntimeException("该好友不存在");
        }
        // 保存到好友请求列表
        ChatFriendsRequest chatFriendsRequest = new ChatFriendsRequest();
        chatFriendsRequest.setAcceptUserId(acceptUserId);
        chatFriendsRequest.setSendUserId(userId);
        chatFriendsRequest.setStatus("0");
        chatFriendsRequest.setDelFlag("0");
        chatFriendsRequest.setRequestDateTime(new Date());
        chatFriendsRequestMapper.insert(chatFriendsRequest);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changeRequestStatusById(Long userId,Long requestId, String status) {

        ChatFriendsRequest chatFriends = chatFriendsRequestMapper.selectById(requestId);
        if(Objects.isNull(chatFriends)){
            throw new RuntimeException("id有误");
        }

        if(!"0".equals(chatFriends.getStatus())){
            throw new RuntimeException("该请求已处理");
        }
        //同意好友请求
        if("1".equals(status)){
            //添加用户朋友关系表
            ChatUserFriends chatUserFriends = new ChatUserFriends();
            chatUserFriends.setUserId(userId);
            chatUserFriends.setFriendId(chatFriends.getSendUserId());
            chatUserFriendsService.save(chatUserFriends);
            chatUserFriends.setUserId(chatFriends.getSendUserId());
            chatUserFriends.setFriendId(userId);
            chatUserFriendsService.save(chatUserFriends);
            // TODO 添加好友成功 返回信息
//            MsgResult wsResult = new MsgResult();
//            ChatMsgDto chatMsgDto = new ChatMsgDto();
//            chatMsgDto.setContent("我们已经是好友了，来聊天吧");
//            chatMsgDto.setTo();
//            chatMsgDto.setFrom();
//            chatMsgDto.sett
//            wsResult.put("code", MsgStatus.SUCCESS);
//            wsResult.put("data", chatMsgDto);
//            simpMessagingTemplate.convertAndSendToUser(chatMsgDto.getTo(), "/queue/newFriends",wsResult);

        }
        ChatFriendsRequest chatFriendsRequest = new ChatFriendsRequest();
        chatFriendsRequest.setId(requestId);
        chatFriendsRequest.setStatus(status);
        chatFriendsRequestMapper.updateById(chatFriendsRequest);
    }
}
