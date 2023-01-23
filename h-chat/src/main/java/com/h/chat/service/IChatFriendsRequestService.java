package com.h.chat.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.h.chat.domain.ChatFriendsRequest;
import com.h.chat.domain.RequestFriendsVo;

import java.util.List;

/**
 * 好友请求Service接口
 *
 * @author h
 * @date 2023-01-21
 */
public interface IChatFriendsRequestService extends IService<ChatFriendsRequest>
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
     * 批量删除好友请求
     *
     * @param ids 需要删除的好友请求主键集合
     * @return 结果
     */
    public int deleteChatFriendsRequestByIds(Long[] ids);

    /**
     * 删除好友请求信息
     *
     * @param id 好友请求主键
     * @return 结果
     */
    public int deleteChatFriendsRequestById(Long id);


    /**
     * 查询好友请求
     * @param userId 好友请求主键
     * @return 结果
     */
    List<RequestFriendsVo> selectFriendsRequest(Long userId);



    /**
     * 添加好友请求
     * @param userId
     * @param acceptUserId
     */
    void addChatFriendsRequest(Long userId, Long acceptUserId);



    /**
     * 根据id修改状态
     * @param userId
     * @param requestId
     * @param status
     */
    void changeRequestStatusById(Long userId, Long requestId, String status);

}
