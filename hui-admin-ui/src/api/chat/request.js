import request from '@/utils/request'

// 查询好友请求列表
export function listRequest(query) {
  return request({
    url: '/chat/request/list',
    method: 'get',
    params: query
  })
}

// 查询好友请求详细
export function getRequest(id) {
  return request({
    url: '/chat/request/' + id,
    method: 'get'
  })
}

// 新增好友请求
export function addRequest(data) {
  return request({
    url: '/chat/request',
    method: 'post',
    data: data
  })
}

// 修改好友请求
export function updateRequest(data) {
  return request({
    url: '/chat/request',
    method: 'put',
    data: data
  })
}

// 删除好友请求
export function delRequest(id) {
  return request({
    url: '/chat/request/' + id,
    method: 'delete'
  })
}
