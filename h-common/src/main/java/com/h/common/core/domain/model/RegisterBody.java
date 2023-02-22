package com.h.common.core.domain.model;

/**
 * 用户注册对象
 *
 * @author lin
 */
public class RegisterBody extends LoginBody
{
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
