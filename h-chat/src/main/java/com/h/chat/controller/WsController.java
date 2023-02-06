package com.h.chat.controller;

import com.h.chat.domain.ChatMsgDto;
import com.h.chat.service.WsService;
import com.h.common.core.domain.AjaxResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 聊天消息控制器
 * @author: Lin
 * @since: 2023-01-09
 */
@Controller
@Slf4j
public class WsController {

    @Autowired
    private WsService wsService;

    /**
     * 接收好友消息
     * @param authentication 认证信息
     * @param chatMsgDto 消息内容
     */
    @MessageMapping("/ws/chat")
    public void handleChatMsg(Authentication authentication, ChatMsgDto chatMsgDto) {
        wsService.send2User(authentication, chatMsgDto);
    }

    /**
     * 接收机器人消息
     * @param authentication 认证信息
     * @param chatMsgDto 消息内容
     */
    @MessageMapping("/ws/robot")
    public void handleRobotMsg(Authentication authentication, ChatMsgDto chatMsgDto) {
        wsService.send2Robot(authentication, chatMsgDto);
    }




    /**
     * 拉取指定监听路径的未读的WebSocket消息
     * @param destination 监听路径
     * @return 结果
     */
    @PostMapping("/pullUnreadMessage")
    @ResponseBody
    public AjaxResult pullUnreadMessage(String destination){
        return wsService.pullUnreadMessage(destination);
    }




}
