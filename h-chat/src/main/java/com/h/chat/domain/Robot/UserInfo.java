package com.h.chat.domain.Robot;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: Lin
 * @create: 2022-12-24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo implements Serializable {


//    40445cf23e2144828218d7fc95d6f05a
//    25d308027eb147d6b440b78db3d8ab23
    private final String apiKey = "25d308027eb147d6b440b78db3d8ab23";

    private Long userId;

}
