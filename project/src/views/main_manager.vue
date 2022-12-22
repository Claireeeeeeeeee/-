<template>
  <el-container class="main_body">
    <el-aside width="300px" style="height: 100%">
      <el-menu default-active="2"  class="el-menu-vertical-demo" router
               background-color="#304156" text-color="#acb9c8" active-text-color="#0c9eff" style="height: 100%">
        <el-submenu index="1">
          <template slot="title">
            <span>员工管理</span>
            <el-menu-item index="/employee_manage">查看各部门员工</el-menu-item>
            <el-menu-item index="/employee_update">修改员工信息</el-menu-item>
          </template>
        </el-submenu>
      </el-menu>
    </el-aside>
    <el-container>
      <el-header style="height: 50px;background-color:#eff2f7;line-height: 50px;padding: 0 10px;font-size: 15px;color:rgba(0,0,0,.8);">
        <el-container>
          <el-container style="justify-content: right;font-size: 15px">
            你好经理
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
