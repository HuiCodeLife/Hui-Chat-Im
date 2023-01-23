package com.h.chat.domain;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.h.common.annotation.Excel;
import com.h.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 聊天记录对象 chat_msg
 *
 * @author h
 * @date 2023-01-22
 */
public class ChatMsgVo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private Long id;

    /**
     * 发送者id
     */
    @Excel(name = "发送者id")
    private Long sendUserId;

    /**
     * 接收者id
     */
    @Excel(name = "接收者id")
    private Long acceptUserId;

    /**
     * 消息内容
     */
    @Excel(name = "消息内容")
    private String content;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setSendUserId(Long sendUserId) {
        this.sendUserId = sendUserId;
    }

    public Long getSendUserId() {
        return sendUserId;
    }

    public void setAcceptUserId(Long acceptUserId) {
        this.acceptUserId = acceptUserId;
    }

    public Long getAcceptUserId() {
        return acceptUserId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }



    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("sendUserId", getSendUserId())
                .append("acceptUserId", getAcceptUserId())

                .append("content", getContent())
                .append("createTime", getCreateTime())
                .toString();
    }
}
