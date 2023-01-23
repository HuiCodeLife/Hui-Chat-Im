package com.h.chat.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author: Lin
 * @create: 2022-12-29
 */
@Data
public class ChatUserFriends implements Serializable {

    private Long userId;

    private Long friendId;

}
