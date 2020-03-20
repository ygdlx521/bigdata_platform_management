<template>
    <div>
        <el-form class="loginForm" :rules="rules" :model="loginForm">
            <h3>登录大数据平台</h3>
            <el-form-item prop="username" label="用户名">
                <el-input type="text"  v-model="loginForm.username" placeholder="请输入用户名"></el-input>
            </el-form-item>
            <el-form-item prop="password" label="密码">
                <el-input type="password" v-model="loginForm.password" placeholder="请输入密码"></el-input>
            </el-form-item>
            <el-checkbox v-model="checked">记住密码</el-checkbox>
            <br>
            <br>
            <el-button type="primary" size="100">登录</el-button>
        </el-form>
    </div>
</template>

<script>
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
</style>