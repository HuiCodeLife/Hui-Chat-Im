package com.h.chat.controller;


import com.h.chat.service.ChatUserFriendsService;
import com.h.chat.service.IChatFriendsRequestService;
import com.h.common.core.controller.BaseController;
import com.h.common.core.domain.AjaxResult;
import com.h.common.core.domain.entity.SysUser;
import com.h.common.core.page.TableDataInfo;
import com.h.common.utils.SecurityUtils;
import com.h.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户信息
 *
 * @author lin
 * @date 2023-01-22
 */
@RestController
@RequestMapping("/chat/user")
public class ChatUserController extends BaseController
{
    @Autowired
    private ISysUserService userService;


    @Autowired
    private IChatFriendsRequestService chatFriendsRequestService;


    @Autowired
    private ChatUserFriendsService chatUserFriendsService;


    /**
     * 获取当前用户的好友列表
     * @return
     */
    @GetMapping
    public AjaxResult getFriends(){
        Long userId = SecurityUtils.getUserId();
        List<SysUser> data = userService.selectFriendsByUserId(userId);
        return AjaxResult.success(data);
    }

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    @GetMapping("/{username}")
    public AjaxResult searchUserByUsername(@PathVariable("username") String username){
        SysUser user = userService.selectUserByUserName(username);
        return AjaxResult.success(user);
    }
    /**
     * 根据用户id发送添加用户请求
     * @return
     */
    @PostMapping("/{acceptUserId}")
    public AjaxResult addUserByUserId(@PathVariable("acceptUserId") Long acceptUserId){
        Long userId = SecurityUtils.getUserId();
        chatFriendsRequestService.addChatFriendsRequest(userId,acceptUserId);
        return AjaxResult.success();
    }

    @DeleteMapping("/{friendId}")
    public AjaxResult deleteFriend(@PathVariable("friendId") String friendId){
        Long userId = SecurityUtils.getUserId();
        chatUserFriendsService.deleteUserFriendsRef(userId,friendId);
        return AjaxResult.success();
    }




}
