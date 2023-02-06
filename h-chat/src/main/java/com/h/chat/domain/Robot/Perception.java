package com.h.chat.domain.Robot;

import lombok.Data;

import java.io.Serializable;
import java.util.Map;

/**
 * @Author: Lin
 * @create: 2022-12-24
 */
@Data
public class Perception implements Serializable {

    private Map<String,String> inputText;

    private Map<String,String> inputImage;
}
