/*
统一处理错误响应消息，不需要在各个页面处理错误响应消息了。
 */
import axios from 'axios'
import { Message } from 'element-ui'; // 单独引入

/* 响应拦截器。失败分为业务失败（数据库没有写进去，但是请求返回200）与网络失败两种（404）
error.response = {
    status: 200,
    data = {
        "status": 500,
        "msg": "用户名或者密码输入错误，请重新输入!",
        "obj": null
    }
}

 */
axios.interceptors.response.use(success=>{
    // 业务失败
    if(success.status && success.status === 200 && success.data.status === 500){
        Message.error({message:success.data.msg});
        return;
    }
    if(success.data.msg){
        Message.success({message: success.data.msg})
    }
    return success.data;
}, error => {
    if(error.response.status === 504 || error.response.status === 404){
        Message.error({message:"页面不见啦！"})
    } else if(error.response.status === 403){
        Message.error({message:"权限不足，请联系管理员！"})
    } else if(error.response.status === 401){
        Message.error({message:"尚未登录，请登录！"})
    }else {
        if (error.response.data.msg) {
            Message.error({message: error.response.data.msg})
        } else {
            Message.error({message:"未知错误！"})
        }
    }

});

/*
封装请求
 */
let base = '';
export const postkeyValueRequest = (url, params) => {
    return axios({
        method:'post',
        url:`${base}${url}`,
        data: params, // 默认以json的方式传到服务器，spring security 不支持，所以需要下面 transform。
        transformRequest:[function (data) {
            let ret = '';
            for(let i in data) {
                ret += encodeURIComponent(i) + '=' + encodeURIComponent(data[i]) + '&'
            }
            return ret;
        }],
        headers:{
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    })
};

// 默认传递json的post,put等
export  const postRequest = (url, params) => {
    return axios({
        method: 'post',
        url: `${base}${url}`,
        data: params
    })
};

export  const putRequest = (url, params) => {
    return axios({
        method: 'put',
        url: `${base}${url}`,
        data: params
    })
};

export  const getRequest = (url, params) => {
    return axios({
        method: 'get',
        url: `${base}${url}`,
        data: params
    })
};

export  const deleteRequest = (url, params) => {
    return axios({
        method: 'delete',
        url: `${base}${url}`,
        data: params
    })
};

