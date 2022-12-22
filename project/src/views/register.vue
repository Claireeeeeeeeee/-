<template>
  <div class="login-wrap">
    <el-form class="login-container">
      <h1 class="title">用户登陆</h1>
      <el-form-item >
        <el-input type="text" v-model="username"  placeholder="用户账号" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="text" v-model="phonenum"  placeholder="手机号码" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="password" v-model="password" placeholder="用户密码" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-checkbox v-model="employee">员工注册</el-checkbox>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="reg" style="width: 100%;">注册</el-button>
      </el-form-item>
      <el-row style="text-align: center;margin-top: -10px;">
        <el-link type="primary" @click="$router.push('/login')">返回登录</el-link>
      </el-row>
    </el-form>
  </div>
</template>
<script>
import router from "@/router";

export default {
  name: "register",
  data() {
    return {
      employee:'',
      username:'',
      phonenum:'',
      password:'',
    };
  },
  methods:{
    reg(){
      // this.$router.push('/login')
      console.log(this.employee)
      axios.post("/api/user/addUser",{
        name:this.username,
        phonenum:this.phonenum,
        password:this.password,
        identity:this.employee,
      },
      {}
      ).then(res=>{
        console.log(res)
        alert("注册成功")
      })
    }
  }
}
</script>

<style scoped>
.login-wrap {
  box-sizing: border-box;
  width: 100%;
  height: 100%;
  padding-top: 10%;
  background-image: url("../../src/assets/img.png");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}

.login-container {
  border-radius: 10px;
  margin: 0px auto;
  width: 350px;
  padding: 30px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  text-align: left;
  box-shadow: 0 0 20px 2px rgba(0, 0, 0, 0.1);
}

.title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
</style>
