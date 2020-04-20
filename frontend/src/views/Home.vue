<template>
    <el-container>
        <el-header class="homeHeader">
            <div class="title">企业大数据平台</div>
            <el-dropdown class="dropdown" @command="commandHandler">
                <span class="el-dropdown-link">
                {{user.name}}<i class="el-icon-arrow-down el-icon--right"></i>
                </span>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item command="userCenter">个人中心</el-dropdown-item>
                    <el-dropdown-item command="switchRole">切换角色</el-dropdown-item>
                    <el-dropdown-item command="logout" divided>注销登录</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </el-header>
        <el-container>
            <el-aside width="200px">
                <el-menu router unique-opened>
                    <el-submenu :index="index+''" v-for="(item,index) in routes" v-if="!item.hidden" :key="index" >
                        <template slot="title">
                            <i style="color: #3a8ee6;margin-right: 6px" :class="item.iconCls"></i>
                            <span>{{item.name}}</span>
                        </template>
<!--                        <el-menu-item index="/test1">选项1</el-menu-item>-->
<!--                        <el-menu-item index="/test2">选项2</el-menu-item>-->
                        <el-menu-item :index="child.path" v-for="(child,indexj) in item.children" :key="indexj">
                            {{child.name}}
                        </el-menu-item>
                    </el-submenu>
                </el-menu>
            </el-aside>
            <el-main>
                <el-breadcrumb separator-class="el-icon-arrow-right" v-if="this.$router.currentRoute.path!=='/home'">
                    <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
                    <el-breadcrumb-item>{{this.$router.currentRoute.name}}</el-breadcrumb-item>
                </el-breadcrumb>
                <div class="homeWelcome" v-if="this.$router.currentRoute.path==='/home'">
                    欢迎来到大数据平台！
                </div>
                <!-- 两个 router-view，一个主，一个子页面的，通过router、index.js里边children控制-->
                <router-view/>
            </el-main>
        </el-container>
    </el-container>
</template>

<script>
    export default {
        name: "Home",
        data() {
            return {
                user:JSON.parse(window.sessionStorage.getItem('user'))
            }
        },
        computed: {
            routes(){
                return this.$store.state.routes;
            }
        },
        methods: {
            // menuClick(index, indexPath) {
            //     this.$router.push(index);
            //     console.log(index);
            //     console.log(indexPath)
            // },
            // 可以自动跳转
            commandHandler(cmd) {
                if(cmd === 'logout') {
                    this.$confirm('此操作将注登录, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        this.getRequest('/logout');
                        window.sessionStorage.removeItem('user');
                        this.$store.commit('initRoutes',[]);
                        this.$router.replace('/')
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消操作'
                        });
                    });
                }
            }
        }
    }
</script>

<style scoped>
    .homeWelcome {
        text-align: center;
        font-size: 30px;
        font-family: 楷体,serif;
        color: #409eff;
        padding-top: 50px;
    }

    .homeHeader{
        background-color: #3a8ee6;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 15px;
        box-sizing: border-box;
    }
    .title{
        font-size: 25px;
        font-family: 楷体,serif;
        color: white;
    }
    .dropdown{
        cursor: pointer;
    }
</style>