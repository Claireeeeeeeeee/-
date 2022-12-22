<template>
  <el-container class="main_body">
    <el-aside width="300px" style="height: 100%">
      <el-menu default-active="2"  class="el-menu-vertical-demo" router
               background-color="#304156" text-color="#acb9c8" active-text-color="#0c9eff" style="height: 100%">
        <el-submenu index="2">
          <template slot="title">
            <span>预约入住</span>
          </template>
          <el-menu-item index="/selectroom">房间挑选</el-menu-item>
        </el-submenu>

        <el-submenu index="3">
          <template slot="title">
            <span>客房服务</span>
          </template>
          <el-menu-item index="/orderselect">服务选择</el-menu-item>
        </el-submenu>

        <el-submenu index="1">
          <template slot="title">
            <i class="el-icon-user-solid"></i>
            <span>我的</span>
          </template>
          <el-menu-item index="/historypresent">会员礼物兑换</el-menu-item>
        </el-submenu>
      </el-menu>
    </el-aside>
    <el-container>
      <el-header style="height: 50px;background-color:#eff2f7;line-height: 50px;padding: 0 10px;font-size: 15px;color:rgba(0,0,0,.8);">
        <el-container>
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">
              <el-container style="justify-content: right;font-size: 15px">
            你好{{this.myName}}
          </el-container>
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item >我的积分{{this.mcount}}</el-dropdown-item>
              <el-dropdown-item >我的等级{{this.level}}</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
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
      myName:'',
      mcount:'',
      level:'',
      document
    }

  },
  methods:{

  },
  components: {

  },
  created() {
    let re = new RegExp("\s?" + "name" + "=([^;]+)(;|$)")
    console.log(document.cookie.match(re)[1])
    this.myName=document.cookie.match(re)[1]
    axios.post("/api/user/searchMyinformation",{
      mname:this.myName
    },{}).then(res=>{
      console.log(res.data.length)
      console.log(res.data[0])
      this.level=res.data[0].level
      this.mcount=res.data[0].mcount
    })
  }
}
</script>
