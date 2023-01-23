package com.h.chat.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.h.chat.domain.ChatUserFriends;
import com.h.chat.mapper.ChatUserFriendsMapper;
import com.h.chat.service.ChatUserFriendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Lin
 * @create: 2022-12-30
 */
@Service
public class ChatUserFriendsServiceImpl extends ServiceImpl<ChatUserFriendsMapper, ChatUserFriends> implements ChatUserFriendsService {

    @Autowired
    private ChatUserFriendsMapper chatUserFriendsMapper;

    @Override
    public boolean isFriend(Long userId, Long friendId) {
        Long count = Long.valueOf(lambdaQuery().eq(ChatUserFriends::getUserId, userId).eq(ChatUserFriends::getFriendId, friendId).count());
        return count > 0;
    }

    @Override
    public void deleteUserFriendsRef(Long userId, String friendId) {
        chatUserFriendsMapper.deleteFriendsRef(userId,friendId);
    }
}
