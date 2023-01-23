package com.h.chat.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: Lin
 * @create: 2022-12-11
 */
@Data
public class ChatMsgDto implements Serializable {

	private String from;

	private String to;

	private String fromNickName;
	/**
	 * 接收者id
	 */
	private Long acceptUserId;
	/**
	 * 消息内容
	 */
	private String content;


	private Date createTime;

}

