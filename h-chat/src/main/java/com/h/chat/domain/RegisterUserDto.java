package com.h.chat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: Lin
 * @since: 2023-02-22
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterUserDto {
    private String username;
    private String password;
    private String email;
    private String code;
}
