package com.h.chat.domain.Robot;

import lombok.Data;

import java.io.Serializable;

/**
 * 图灵机器人请求体数据封装
 * @Author: Lin
 * @create: 2022-12-24
 */
@Data
public class PostData implements Serializable {

    /**
     * 输入类型:0-文本(默认)、1-图片、2-音频
     */
    private int reqType;

    /**
     * 输入信息
     */
    private Perception perception;

    /**
     * 用户参数
     */
    private UserInfo userInfo;

}
