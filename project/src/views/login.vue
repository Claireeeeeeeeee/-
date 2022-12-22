<template>
  <div class="login-wrap">
    <el-form class="login-container">
      <h1 class="title">用户登陆</h1>
      <el-form-item >
        <el-input type="text" v-model="username"  placeholder="用户账号" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="password" v-model="password" placeholder="用户密码" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-checkbox-group v-model="checkList" @change="bindCheckBox">
          <el-checkbox label="1">我是顾客</el-checkbox>
          <el-checkbox label="2">我是员工</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="doLogin" style="width: 100%;">登陆</el-button>
      </el-form-item>
      <el-row style="text-align: center;margin-top: -10px;">
        <div>
          <el-link type="primary" @click="$router.push('/register')">注册账号</el-link>
        </div>

      </el-row>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "login",
  data() {
    return {
      username:'',
      password:'',
      checkList:[],
      document
    };
  },
  methods:{
    bindCheckBox(value){
      if(this.checkList.length > 1){
        this.checkList.splice(0,1)
      }
      console.log(this.checkList[0])
    },
    doLogin(){
      if (this.checkList[0]==='1'){
        axios.post("/api/user/getmember",{
          name:this.username,
          password:this.password
        },{}).then(res=>{
          document.cookie="name="+this.username
          console.log(res)
          this.$router.push("/main_customer")
        })
      }
      else if(this.checkList[0]==='2'){
        axios.post("/api/user/getemployee",{
          ename:this.username,
          epassword:this.password,
        },{}).then(res=>{
          console.log(res)
          if(res.data[0].department=='经理')
            this.$router.push("/main_manager")
          else
          this.$router.push("/main_employee")
        })
      }
      else {
        this.$alert("请勾选后登录")
      }

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
