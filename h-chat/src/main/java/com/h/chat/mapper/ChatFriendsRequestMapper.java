package com.h.chat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.h.chat.domain.ChatFriendsRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 好友请求Mapper接口
 *
 * @author h
 * @date 2023-01-21
 */
@Mapper
public interface ChatFriendsRequestMapper extends BaseMapper<ChatFriendsRequest>
{
    /**
     * 查询好友请求
     *
     * @param id 好友请求主键
     * @return 好友请求
     */
    public ChatFriendsRequest selectChatFriendsRequestById(Long id);

    /**
     * 查询好友请求列表
     *
     * @param chatFriendsRequest 好友请求
     * @return 好友请求集合
     */
    public List<ChatFriendsRequest> selectChatFriendsRequestList(ChatFriendsRequest chatFriendsRequest);

    /**
     * 新增好友请求
     *
     * @param chatFriendsRequest 好友请求
     * @return 结果
     */
    public int insertChatFriendsRequest(ChatFriendsRequest chatFriendsRequest);

    /**
     * 修改好友请求
     *
     * @param chatFriendsRequest 好友请求
     * @return 结果
     */
    public int updateChatFriendsRequest(ChatFriendsRequest chatFriendsRequest);

    /**
     * 删除好友请求
     *
     * @param id 好友请求主键
     * @return 结果
     */
    public int deleteChatFriendsRequestById(Long id);

    /**
     * 批量删除好友请求
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChatFriendsRequestByIds(Long[] ids);
}
