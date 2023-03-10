package com.h.chat.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.h.chat.domain.ChatUserFriends;
import com.h.common.core.domain.AjaxResult;

/**
 * 好友相关Service接口
 *
 * @Author: Lin
 * @create: 2022-12-30
 */
public interface ChatUserFriendsService extends IService<ChatUserFriends> {


    /**
     * 判断是否是好友
     * @param userId 用户id
     * @param friendId 好友id
     * @return
     */
    boolean isFriend(Long userId, Long friendId);

    /**
     * 删除好友关系
     * @param userId
     * @param friendId
     */
    void deleteUserFriendsRef(Long userId, String friendId);

}
