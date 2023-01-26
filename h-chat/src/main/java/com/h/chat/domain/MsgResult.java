package com.h.chat.domain;

import java.util.HashMap;
/**
 * 简单自定义消息返回格式
 * @author: Lin
 * @since: 2023-01-11
 */
public class MsgResult extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    /** 状态码 */
    public static final String CODE_TAG = "code";

    /** 返回内容 */
    public static final String MSG_TAG = "msg";

    /** 数据对象 */
    public static final String DATA_TAG = "data";
    public MsgResult()
    {
    }



    public MsgResult(int code, String msg, Object data)
    {
        super.put(CODE_TAG, code);
        super.put(MSG_TAG, msg);
        super.put(DATA_TAG, data);
    }

    /**
     * 方便链式调用
     *
     * @param key 键
     * @param value 值
     * @return 数据对象
     */
    @Override
    public MsgResult put(String key, Object value)
    {
        super.put(key, value);
        return this;
    }

}
