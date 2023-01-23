package com.h.chat.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.h.chat.domain.ChatMsg;

import java.util.List;

/**
 * @Author: Lin
 * @create: 2022-12-16
 */
public interface ChatMsgService extends IService<ChatMsg> {

    /**
     * 查询聊天记录
     *
     * @param id 聊天记录主键
     * @return 聊天记录
     */
    public ChatMsg selectChatMsgById(Long id);

    /**
     * 查询聊天记录列表
     *
     * @param chatMsg 聊天记录
     * @return 聊天记录集合
     */
    public List<ChatMsg> selectChatMsgList(ChatMsg chatMsg);

    /**
     * 新增聊天记录
     *
     * @param chatMsg 聊天记录
     * @return 结果
     */
    public int insertChatMsg(ChatMsg chatMsg);

    /**
     * 修改聊天记录
     *
     * @param chatMsg 聊天记录
     * @return 结果
     */
    public int updateChatMsg(ChatMsg chatMsg);

    /**
     * 批量删除聊天记录
     *
     * @param ids 需要删除的聊天记录主键集合
     * @return 结果
     */
    public int deleteChatMsgByIds(Long[] ids);

    /**
     * 删除聊天记录信息
     *
     * @param id 聊天记录主键
     * @return 结果
     */
    public int deleteChatMsgById(Long id);


}
