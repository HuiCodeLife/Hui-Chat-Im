package com.h.chat.controller;


import com.h.chat.domain.ChatFriendsRequest;
import com.h.chat.domain.MsgResult;
import com.h.chat.service.ChatUserFriendsService;
import com.h.chat.service.IChatFriendsRequestService;
import com.h.common.constant.FriendRequestConstants;
import com.h.common.core.controller.BaseController;
import com.h.common.core.domain.AjaxResult;
import com.h.common.core.domain.entity.SysUser;
import com.h.common.core.domain.model.RegisterBody;
import com.h.common.utils.SecurityUtils;
import com.h.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.h.common.constant.FriendRequestConstants.NEW_REQUEST_MSG;

/**
 * 用户信息
 *
 * @author lin
 * @date 2023-01-22
 */
@RestController
@RequestMapping("/chat/user")
public class ChatUserController extends BaseController {
    @Autowired
    private ISysUserService userService;


    @Autowired
    private IChatFriendsRequestService chatFriendsRequestService;


    @Autowired
    private ChatUserFriendsService chatUserFriendsService;


    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    /**
     * 获取当前用户的好友列表
     *
     * @return
     */
    @GetMapping
    public AjaxResult getFriends() {
        Long userId = SecurityUtils.getUserId();
        List<SysUser> data = userService.selectFriendsByUserId(userId);
        return AjaxResult.success(data);
    }

    /**
     * 根据用户名查找用户
     *
     * @param username
     * @return
     */
    @GetMapping("/{username}")
    public AjaxResult searchUserByUsername(@PathVariable("username") String username) {
        SysUser user = userService.selectUserByUserName(username);
        return AjaxResult.success(user);
    }

    /**
     * 根据用户id发送添加用户请求
     *
     * @return
     */
    @PostMapping("/{acceptUserId}")
    public AjaxResult addUserByUserId(@PathVariable("acceptUserId") Long acceptUserId) {
        Long userId = SecurityUtils.getUserId();
//        // TODO 重复请求处理
//        ChatFriendsRequest chatFriendsRequest = chatFriendsRequestService.selectChatFriendsRequestBySendUserIdAndAcceptUserId(userId, acceptUserId);
//        if (chatFriendsRequest != null && FriendRequestConstants.REQUEST_UNDO.equals(chatFriendsRequest.getStatus())) {
//            // 存在未处理的相同的好友请求
//            return AjaxResult.success("重复请求");
//        }
        chatFriendsRequestService.addChatFriendsRequest(userId, acceptUserId);
        SysUser acceptUser = userService.selectUserById(acceptUserId);
        if (acceptUser == null) {
            // 接收者不存在
            throw new RuntimeException("请求错误，请确定对方存在");
        }
        // 如果对方在线 推送新好友请求消息
        simpMessagingTemplate.convertAndSendToUser(acceptUser.getUserName(), "/queue/newRequest", NEW_REQUEST_MSG);
        return AjaxResult.success();
    }

    @DeleteMapping("/{friendId}")
    public AjaxResult deleteFriend(@PathVariable("friendId") String friendId) {
        Long userId = SecurityUtils.getUserId();
        chatUserFriendsService.deleteUserFriendsRef(userId, friendId);
        return AjaxResult.success();
    }


    /**
     * 发送邮件验证码
     * @param email 邮箱地址
     * @return
     */
    @PostMapping("/code")
    public AjaxResult sendCode(@RequestParam("email") String email){
        return userService.sendCode(email);
    }

}
