<template>
  <el-container class="main_body">
    <el-aside width="300px" style="height: 100%">
      <el-menu default-active="2"  class="el-menu-vertical-demo" router
               background-color="#304156" text-color="#acb9c8" active-text-color="#0c9eff" style="height: 100%">
        <el-submenu index="1">
          <template slot="title">
            <span>前台管理</span>
          </template>
          <el-menu-item index="/frontManagement">线下入住登记与退房</el-menu-item>
          <el-menu-item index="/onlineManagement">线上预定处理</el-menu-item>
          <el-menu-item index="/roomstatus">房间状态查询</el-menu-item>
        </el-submenu>

        <el-submenu index="2">
          <template slot="title">
            <span>订单管理</span>
          </template>
          <el-menu-item index="/pendingOrders">待处理订单</el-menu-item>
        </el-submenu>

        <el-submenu index="3">
          <template slot="title">
            <span>会员管理</span>
          </template>
          <el-menu-item index="/presentManagement">礼品</el-menu-item>
        </el-submenu>


      </el-menu>
    </el-aside>
    <el-container>
      <el-header style="height: 50px;background-color:#eff2f7;line-height: 50px;padding: 0 10px;font-size: 15px;color:rgba(0,0,0,.8);">
        <el-container>
          <el-container style="justify-content: right;font-size: 15px">
            你好员工
          </el-container>
        </el-container>
      </el-header>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>
<style>

.el-dropdown-menu {
  top: 40px !important;
}
*{
  padding: 0;
  margin: 0;
}
.main_body{
  height: 100%;
}
</style>
<script>

export default {
  name: '',
  data(){
    return{
      document
    }

  },
  methods:{},
  components:{

  }
}
</script>
