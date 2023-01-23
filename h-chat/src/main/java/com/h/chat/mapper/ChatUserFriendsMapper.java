package com.h.chat.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.h.chat.domain.ChatUserFriends;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @Author: Lin
 * @create: 2022-12-30
 */
@Mapper
public interface ChatUserFriendsMapper extends BaseMapper<ChatUserFriends> {
    /**
     * 删除好友关系
     * @param userId
     * @param friendId
     */
    void deleteFriendsRef(@Param("userId") Long userId, @Param("friendId") String friendId);

}
