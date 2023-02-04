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


// 查询用户个人信息
export function getUserProfile() {
  return request({
    url: '/system/user/profile',
    method: 'get'
  })
}

// 修改用户个人信息
export function updateUserProfile(data) {
  return request({
    url: '/system/user/profile',
    method: 'put',
    data: data
  })
}

// 用户密码重置
export function updateUserPwd(oldPassword, newPassword) {
  const data = {
    oldPassword,
    newPassword
  }
  return request({
    url: '/system/user/profile/updatePwd',
    method: 'put',
    params: data
  })
}

// 用户头像上传
export function uploadAvatar(data) {
  return request({
    url: '/system/user/profile/avatar',
    method: 'post',
    data: data
  })
}
