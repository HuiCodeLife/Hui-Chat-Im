package com.h.chat.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.h.chat.domain.ChatMsg;
import com.h.chat.mapper.ChatMsgMapper;
import com.h.chat.service.ChatMsgService;
import com.h.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: Lin
 */
@Service
public class ChatMsgServiceImpl extends ServiceImpl<ChatMsgMapper, ChatMsg> implements ChatMsgService {

    @Autowired
    private ChatMsgMapper chatMsgMapper;

    /**
     * 查询聊天记录
     *
     * @param id 聊天记录主键
     * @return 聊天记录
     */
    @Override
    public ChatMsg selectChatMsgById(Long id)
    {
        return chatMsgMapper.selectChatMsgById(id);
    }

    /**
     * 查询聊天记录列表
     *
     * @param chatMsg 聊天记录
     * @return 聊天记录
     */
    @Override
    public List<ChatMsg> selectChatMsgList(ChatMsg chatMsg)
    {
        List<ChatMsg> chatMsgs = chatMsgMapper.selectChatMsgList(chatMsg);

        return chatMsgs;
    }

    /**
     * 新增聊天记录
     *
     * @param chatMsg 聊天记录
     * @return 结果
     */
    @Override
    public int insertChatMsg(ChatMsg chatMsg)
    {
        chatMsg.setCreateTime(DateUtils.getNowDate());
        return chatMsgMapper.insertChatMsg(chatMsg);
    }

    /**
     * 修改聊天记录
     *
     * @param chatMsg 聊天记录
     * @return 结果
     */
    @Override
    public int updateChatMsg(ChatMsg chatMsg)
    {
        return chatMsgMapper.updateChatMsg(chatMsg);
    }

    /**
     * 批量删除聊天记录
     *
     * @param ids 需要删除的聊天记录主键
     * @return 结果
     */
    @Override
    public int deleteChatMsgByIds(Long[] ids)
    {
        return chatMsgMapper.deleteChatMsgByIds(ids);
    }

    /**
     * 删除聊天记录信息
     *
     * @param id 聊天记录主键
     * @return 结果
     */
    @Override
    public int deleteChatMsgById(Long id)
    {
        return chatMsgMapper.deleteChatMsgById(id);
    }
}
