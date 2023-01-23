package com.h.chat.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.h.chat.domain.ChatMsg;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * @Author: Lin
 * @create: 2022-12-16
 */
@Mapper
public interface ChatMsgMapper extends BaseMapper<ChatMsg> {

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
     * 删除聊天记录
     *
     * @param id 聊天记录主键
     * @return 结果
     */
    public int deleteChatMsgById(Long id);

    /**
     * 批量删除聊天记录
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChatMsgByIds(Long[] ids);

}
