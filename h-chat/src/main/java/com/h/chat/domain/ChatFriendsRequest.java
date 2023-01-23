package com.h.chat.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.h.common.annotation.Excel;
import com.h.common.core.domain.BaseEntity;

/**
 * 好友请求对象 chat_friends_request
 *
 * @author h
 * @date 2023-01-21
 */
public class ChatFriendsRequest
{
    private static final long serialVersionUID = 1L;

    /** id */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 请求者id */
    @Excel(name = "请求者id")
    private Long sendUserId;

    /** 接收方id */
    @Excel(name = "接收方id")
    private Long acceptUserId;

    /** 发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date requestDateTime;

    /** 删除状态 */
    private String delFlag;

    /** 状态 [0未处理  1同意 2拒绝 3忽略] */
    @Excel(name = "状态 [0未处理  1同意 2拒绝 3忽略]")
    private String status;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setSendUserId(Long sendUserId)
    {
        this.sendUserId = sendUserId;
    }

    public Long getSendUserId()
    {
        return sendUserId;
    }
    public void setAcceptUserId(Long acceptUserId)
    {
        this.acceptUserId = acceptUserId;
    }

    public Long getAcceptUserId()
    {
        return acceptUserId;
    }
    public void setRequestDateTime(Date requestDateTime)
    {
        this.requestDateTime = requestDateTime;
    }

    public Date getRequestDateTime()
    {
        return requestDateTime;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("sendUserId", getSendUserId())
            .append("acceptUserId", getAcceptUserId())
            .append("requestDateTime", getRequestDateTime())
            .append("delFlag", getDelFlag())
            .append("status", getStatus())
            .toString();
    }
}
