package com.h.chat.service;

import com.h.chat.domain.ChatMsgDto;
import com.h.common.core.domain.AjaxResult;
import org.springframework.security.core.Authentication;

/**
 * 聊天相关服务类
 * @author: Lin
 * @since: 2023-01-11
 */
public interface WsService {

    /**
     * 用户与用户聊天
     * @param authentication 用户认证信息
     * @param chatMsgDto 聊天信息封装类
     */
    public void send2User(Authentication authentication, ChatMsgDto chatMsgDto);

    /**
     * 用户与机器人聊天
     * @param authentication 用户认证信息
     * @param chatMsgDto 聊天信息封装类
     */
    public void send2Robot(Authentication authentication, ChatMsgDto chatMsgDto);


    /**
     * 用户登陆拉去未读消息
     * @param destination
     * @return
     */
    public AjaxResult pullUnreadMessage(String destination);
}
