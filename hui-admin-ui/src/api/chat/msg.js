import request from '@/utils/request'

// 查询聊天记录列表
export function listMsg(query) {
  return request({
    url: '/chat/msg/list',
    method: 'get',
    params: query
  })
}

// 查询聊天记录详细
export function getMsg(id) {
  return request({
    url: '/chat/msg/' + id,
    method: 'get'
  })
}

// 新增聊天记录
export function addMsg(data) {
  return request({
    url: '/chat/msg',
    method: 'post',
    data: data
  })
}

// 修改聊天记录
export function updateMsg(data) {
  return request({
    url: '/chat/msg',
    method: 'put',
    data: data
  })
}

// 删除聊天记录
export function delMsg(id) {
  return request({
    url: '/chat/msg/' + id,
    method: 'delete'
  })
}
