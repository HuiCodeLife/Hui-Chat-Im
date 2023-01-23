package com.h.chat.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: Lin
 * @create: 2022-12-15
 */
@Data
@TableName("chat_user_friends")
@AllArgsConstructor
@NoArgsConstructor
public class SysUserFriends {

    @TableId
    private String userId;

    private String friendsId;
}
