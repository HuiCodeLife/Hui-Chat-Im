import axios from 'axios'
import { getToken } from '@/utils/auth'
import { Message } from 'element-ui'

// 创建axios实例
const service = axios.create({
    // axios中请求配置有baseURL选项，表示请求URL公共部分
    // baseURL: 'http://localhost:8024',
    baseURL: 'http://localhost:8080',

    // 超时
    timeout: 10000
})

// 添加请求拦截器
service.interceptors.request.use(function (config) {
    // 在发送请求之前做些什么
  // 是否需要设置 token

   const isToken = (config.headers || {}).isToken === false
   if (getToken() && !isToken) {
    config.headers['Authorization'] = 'Bearer ' + getToken() // 让每个请求携带自定义token 请根据实际情况自行修改
  }
    return config;
  }, function (error) {
    // 对请求错误做些什么
    return Promise.reject(error);
  });

// 添加响应拦截器
service.interceptors.response.use(function (res) {
   // 未设置状态码则默认成功状态
   const code = res.data.code || 200;
   // 获取错误信息
  const msg = res.data.msg  || "当前服务器忙，请稍稍再试"
   if (code === 401) {
    Message({ message: msg, type: 'error' })
    this.$store.dispatch('LogOut').then(() => {
      location.href = '/login';
    })
   }else if (code === 500) {
    Message({ message: msg, type: 'error' })
    return Promise.reject(new Error(msg))
  }
    // 对响应数据做点什么
    return res.data;
  }, function (error) {
    // 超出 2xx 范围的状态码都会触发该函数。
    // 对响应错误做点什么
    return Promise.reject(error);
  });

export default service
