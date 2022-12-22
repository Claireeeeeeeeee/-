<template>
  <div class="login-wrap">
    <el-form class="login-container">
      <h1 class="title">员工信息修改</h1>
      <el-form-item >
        <el-input type="text" v-model="eid"  placeholder="员工号" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="text" v-model="ename"  placeholder="员工名" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="text" v-model="department" placeholder="部门" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="int" v-model="salary" placeholder="薪资" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="reg()" style="width: 100%;">确定</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>

export default {
  name: "employee_update",
  data() {
    return {
      eid:'',
      ename:'',
      department:'',
      salary:'',
    };
  },
  methods:{
    reg(){
      axios.post("/api/user/update_emp",{
        ename:this.ename,
        department:this.department,
        salary:this.salary,
        eid:this.eid,
      },{}).then(res=>{
        console.log(res)
        alert("修改成功")
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
