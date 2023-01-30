import request from "@/utils/request";


// 获取用户详细信息
export function getFriends() {
  return request({
    url: '/chat/user',
    method: 'get'
  })
}


// 获取未读信息
export function pullUnreadMessage(destination) {
  return request({
    url: '/pullUnreadMessage',
    method: 'post',
    params: {
      destination:destination
    }
  })
}


// 查询好友
export function searchFriends(username) {
  return request({
    url: '/chat/user/' + username,
    method: 'get'
  })
}


// 根据用户id发送添加用户请求
export function addUserByUserId(acceptUserId) {
  return request({
    url: '/chat/user/' + acceptUserId,
    method: 'post'
  })
}


// 查询好友请求
export function friendsRequest() {
  return request({
    url: '/chat/request/friendsRequest',
    method: 'get'
  })
}


export function changeRequestStatus(requestId,status) {
  return request({
    url: '/chat/request/changeRequestStatus/'+ requestId + '/' + status,
    method: 'put'
  })
}

// 删除好友请求
export function deleteFriend(id) {
  return request({
    url: '/chat/user/'+ id,
    method: 'delete'
  })
}

