<template>
  <el-form :inline="true"  class="demo-form-inline">
    <el-form-item label="礼物名称">
      <el-input v-model="pname" placeholder="礼物名称"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit1">查询</el-button>
    </el-form-item>
    <el-form-item label="礼物id">
      <el-input v-model="pid" placeholder="礼物id"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit2">查询</el-button>
    </el-form-item>
    <br>
    <el-form-item>
      <el-button type="primary" @click="onSubmit3">查询兑换最多的礼物</el-button>
      <el-button type="primary" @click="onSubmit4">查询兑换最少的礼物</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  name:'presentManagement',
  data() {
    return {
        pname: '',
        pid: '',
    }
  },
  methods: {
    onSubmit1() {
      axios.post("/api/user/p2",{
        pname:this.pname
      },{}).then(res=>{
        alert(res.data[0][0].pnum)
      })
    }
    ,
    onSubmit2() {
      axios.post("/api/user/p3",{
        pid:this.pid
      },{}).then(res=>{
        alert(res.data[0][0].pnum)
        console.log(res.data[0][0])
      })
    },
    onSubmit3() {
      axios.get("/api/user/p4",{
      }).then(res=>{
        alert(res.data[0][0].pname)
      })
    },
    onSubmit4() {
      axios.get("/api/user/p5",{
      }).then(res=>{
        alert(res.data[0][0].pname)
      })
    },
    },

}
</script>

<style scoped>

</style>
