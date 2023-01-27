package com.h;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author h
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class HuiApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(HuiApplication.class, args);
        System.out.println("Hui Chat启动成功");
    }
}
