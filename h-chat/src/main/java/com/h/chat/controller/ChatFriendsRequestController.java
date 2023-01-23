package com.h.chat.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.h.chat.domain.ChatFriendsRequest;
import com.h.chat.domain.RequestFriendsVo;
import com.h.common.utils.SecurityUtils;
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
import com.h.chat.service.IChatFriendsRequestService;
import com.h.common.utils.poi.ExcelUtil;
import com.h.common.core.page.TableDataInfo;

/**
 * 好友请求Controller
 *
 * @author h
 * @date 2023-01-21
 */
@RestController
@RequestMapping("/chat/request")
public class ChatFriendsRequestController extends BaseController
{
    @Autowired
    private IChatFriendsRequestService chatFriendsRequestService;

    /**
     * 查询好友请求列表
     */
    @PreAuthorize("@ss.hasPermi('chat:request:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChatFriendsRequest chatFriendsRequest)
    {
        startPage();
        List<ChatFriendsRequest> list = chatFriendsRequestService.selectChatFriendsRequestList(chatFriendsRequest);
        return getDataTable(list);
    }

    /**
     * 导出好友请求列表
     */
    @PreAuthorize("@ss.hasPermi('chat:request:export')")
    @Log(title = "好友请求", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChatFriendsRequest chatFriendsRequest)
    {
        List<ChatFriendsRequest> list = chatFriendsRequestService.selectChatFriendsRequestList(chatFriendsRequest);
        ExcelUtil<ChatFriendsRequest> util = new ExcelUtil<ChatFriendsRequest>(ChatFriendsRequest.class);
        util.exportExcel(response, list, "好友请求数据");
    }

    /**
     * 获取好友请求详细信息
     */
    @PreAuthorize("@ss.hasPermi('chat:request:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(chatFriendsRequestService.selectChatFriendsRequestById(id));
    }

    /**
     * 新增好友请求
     */
    @PreAuthorize("@ss.hasPermi('chat:request:add')")
    @Log(title = "好友请求", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChatFriendsRequest chatFriendsRequest)
    {
        return toAjax(chatFriendsRequestService.insertChatFriendsRequest(chatFriendsRequest));
    }

    /**
     * 修改好友请求
     */
//    @PreAuthorize("@ss.hasPermi('chat:request:edit')")
//    @Log(title = "好友请求", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody ChatFriendsRequest chatFriendsRequest)
//    {
//        return toAjax(chatFriendsRequestService.updateChatFriendsRequest(chatFriendsRequest));
//    }

    /**
     * 删除好友请求
     */
    @PreAuthorize("@ss.hasPermi('chat:request:remove')")
    @Log(title = "好友请求", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(chatFriendsRequestService.deleteChatFriendsRequestByIds(ids));
    }

    /**
     * 查询当前用户的好友请求列表
     */
    @GetMapping("/friendsRequest")
    public AjaxResult getFriendsRequest(){
        AjaxResult ajaxResult = new AjaxResult();
        Long userId = SecurityUtils.getUserId();
        List<RequestFriendsVo> requestFriendsVos = chatFriendsRequestService.selectFriendsRequest(userId);
        long count = requestFriendsVos.stream().filter(r -> "0".equals(r.getStatus())).count();
        ajaxResult.put("data",requestFriendsVos);
        ajaxResult.put("newRequestCount",count);
        return ajaxResult;
    }

    @PutMapping("/changeRequestStatus/{requestId}/{status}")
    public AjaxResult changeRequestStatus(@PathVariable("requestId") Long requestId,
                                          @PathVariable("status") String status){
        Long userId = SecurityUtils.getUserId();
        chatFriendsRequestService.changeRequestStatusById(userId,requestId,status);
        return AjaxResult.success();
    }
}
