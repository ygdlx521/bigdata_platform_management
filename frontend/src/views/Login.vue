<template>
    <div>
        <el-form class="loginForm" ref="loginForm" :rules="rules" :model="loginForm">
            <h3 class="formTitle">大数据平台登录</h3>
            <el-form-item prop="username" label="用户名">
                <el-input type="text"  v-model="loginForm.username" placeholder="请输入用户名" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item prop="password" label="密码">
                <el-input type="password" v-model="loginForm.password" placeholder="请输入密码"></el-input>
            </el-form-item>
            <el-checkbox class="formCheckbox" v-model="checked">记住密码</el-checkbox>
            <el-button class="formButton" type="primary" @click="submitForm">登录</el-button>
        </el-form>
    </div>
</template>

<script>
    // 做成插件后，无需导入
    // import {postkeyValueRequest} from "../utils/api";

    export default {
        name: 'Login',
        data() {
            return {
                rules: {
                    username: { required: true, message: '请输入用户名', trigger: 'blur'},
                    password: { required: true, message: '请输入密码', trigger: 'blur'},
                },
                loginForm: {
                    username: 'daliang',
                    password: '123456'
                },
                checked: true
            }
        },
        methods: {
            submitForm() {
                this.$refs['loginForm'].validate((valid) => {
                    if (valid) {
                        this.postkeyValueRequest('/doLogin', this.loginForm).then(resp=>{
                            // 这里已经通过了拦截器，return success.data; 请求失败是 return; 为 null。
                            if(resp){
                                // 保存用户数据
                                window.sessionStorage.setItem("user", JSON.stringify(resp.obj));
                                // 页面跳转，push能点击浏览器后退后去，replace不能回退
                                // this.$router.replace('/home')
                                let path = this.$route.query.redirect;
                                this.$router.replace((path === '/' || path === undefined) ? '/home' : path);
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        this.$message.error('用户名或者密码没有输入');
                        return false;
                    }
                });
            },

        }
    }
</script>

<style scoped>
    .loginForm {
        border-radius: 15px;
        background-clip: padding-box;
        margin: 200px auto;
        width: 350px;
        padding: 35px 35px 15px 35px;
        background: aliceblue;
        border: 1px;
        box-shadow: 0 0 25px #cac6c6;
    }
    .formTitle {
        margin: 15px auto 15px auto;
        text-align: center;
        color: blue;
    }
    .formCheckbox {
        text-align: left;
        margin: 0 0 15px 0;
    }
    .formButton {
        width: 100%;
    }

</style>