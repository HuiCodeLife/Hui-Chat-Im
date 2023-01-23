package com.h.chat.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: Lin
 * @create: 2022-12-28
 */
@Data
public class RequestFriendsVo implements Serializable {

    private static final long serialVersionUID = 1L;
    /** 用户ID */
    @TableId
    private Long userId;

    /** 用户账号 */
    private Long username;

    /** 用户昵称 */
    private String nickname;


    /** 用户邮箱 */
    private String email;

    /** 手机号码 */
    private String phonenumber;

    /** 用户地址 */
    private String area;

    /** 用户性别 */
    private String sex;

    /** 用户头像 */
    private String avatar;


    private String status;


    private String remark;

    private Long requestId;

    private Date requestDataTime;

}
