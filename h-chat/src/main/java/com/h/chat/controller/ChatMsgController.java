package com.h.chat.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.h.chat.service.ChatMsgService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.h.common.annotation.Log;
import com.h.common.core.controller.BaseController;
import com.h.common.core.domain.AjaxResult;
import com.h.common.enums.BusinessType;
import com.h.chat.domain.ChatMsg;
import com.h.common.utils.poi.ExcelUtil;
import com.h.common.core.page.TableDataInfo;

/**
 * 聊天记录Controller
 *
 * @author h
 * @date 2023-01-22
 */
@RestController
@RequestMapping("/chat/msg")
public class ChatMsgController extends BaseController
{
    @Autowired
    private ChatMsgService chatMsgService;

    /**
     * 查询聊天记录列表
     */
    @PreAuthorize("@ss.hasPermi('chat:msg:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChatMsg chatMsg)
    {
        startPage();
        List<ChatMsg> list = chatMsgService.selectChatMsgList(chatMsg);
        return getDataTable(list);
    }

    /**
     * 导出聊天记录列表
     */
    @PreAuthorize("@ss.hasPermi('chat:msg:export')")
    @Log(title = "聊天记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChatMsg chatMsg)
    {
        List<ChatMsg> list = chatMsgService.selectChatMsgList(chatMsg);
        ExcelUtil<ChatMsg> util = new ExcelUtil<ChatMsg>(ChatMsg.class);
        util.exportExcel(response, list, "聊天记录数据");
    }

    /**
     * 获取聊天记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('chat:msg:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(chatMsgService.selectChatMsgById(id));
    }


    /**
     * 删除聊天记录
     */
    @PreAuthorize("@ss.hasPermi('chat:msg:remove')")
    @Log(title = "聊天记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(chatMsgService.deleteChatMsgByIds(ids));
    }
}
