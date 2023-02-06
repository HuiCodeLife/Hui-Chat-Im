package com.h.chat.utils;

import cn.hutool.http.HttpRequest;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.h.chat.domain.ChatMsgDto;
import com.h.chat.domain.Robot.Perception;
import com.h.chat.domain.Robot.PostData;
import com.h.chat.domain.Robot.UserInfo;
import com.h.common.core.domain.entity.SysUser;

import java.util.HashMap;
import java.util.Map;

/**
 * 图灵机器人工具类
 *
 * @author Lin
 */
public class RobotUtil {
  /**
   * 获取机器人消息
   * @param chatMsgDto 消息内容对象
   * @param user 用户信息
   * @return 机器人返回结果
   */
  public static String getRobotMsg(ChatMsgDto chatMsgDto, SysUser user)  {
    PostData postData = new PostData();
    postData.setReqType(0);
    Perception perception = new Perception();
    Map<String, String> inputText = new HashMap<>(1);
    inputText.put("text", chatMsgDto.getContent());
    perception.setInputText(inputText);
    postData.setPerception(perception);
    postData.setUserInfo(new UserInfo(user.getUserId()));
    String json = JSON.toJSONString(postData);
    String body = HttpRequest.post("http://openapi.turingapi.com/openapi/api/v2")
            .body(json)
            .execute().body();
    JSONObject jsonObject = JSON.parseObject(body);
    JSONArray results = jsonObject.getJSONArray("results");
    JSONObject o = (JSONObject) results.get(0);
    return (String) o.getJSONObject("values").get("text");
  }

}
