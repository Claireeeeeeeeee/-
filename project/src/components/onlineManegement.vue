<template>
  <el-form :inline="true" class="demo-form-inline">
    <el-form-item label="姓名">
      <el-input v-model="name" placeholder="姓名"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit">查询</el-button>
    </el-form-item>
    <el-table
        :data="tableData"
        style="width: 100%;" >
      <el-table-column
          prop="mname"
          label="姓名"
          align="center"
          width="250">
      </el-table-column>
      <el-table-column
          prop="phonenum"
          label="联系方式"
          align="center"
          width="200">
      </el-table-column>
      <el-table-column
          prop="rid"
          label="房间编号"
          align="center"
          width="200">
      </el-table-column>
      <el-table-column
          prop="time"
          label="入住时长"
          align="center"
          width="100">
      </el-table-column>
      <el-table-column
          prop="mid"
          label="会员编号"
          align="center"
          width="100">
      </el-table-column>
      <el-table-column
          label="操作"
          align="center"
          width="200">
        <template slot-scope="scope">
          <el-button @click.native.prevent="add_online(scope.$index)" type="text" size="small">入住</el-button>
          <el-button @click.native.prevent="delete_online(scope.$index)" type="text" size="small">退订</el-button>
        </template>
      </el-table-column>
    </el-table>
  </el-form>
</template>
<script>
export default {
  name: "customer_table",
  data() {
    return {
      tableData:[],
      name:'',
    }
  },
  methods: {
    add_online(index){
      axios.post("/api/user/addonline",{
        phonenum:this.tableData[index].phonenum,
        time:this.tableData[index].time,
        rid:this.tableData[index].rid,
        mid:this.tableData[index].mid,
        mname:this.tableData[index].mname,
      },{}).then(res=>{
        alert("已入住")
        console.log(res)
        console.log(this.tableData[index].mname)
      })
      axios.post("/api/user/deleteonline",{
        mid:this.tableData[index].mid,
      },{}).then(res=>{
        alert("删除成功")
        this.tableData.splice(index,1)
      })
    },
    delete_online(index){
      axios.post("/api/user/deleteonline",{
        mid:this.tableData[index].mid,
      },{}).then(res=>{
        alert("删除成功")
        this.tableData.splice(index,1)
      })
    },

    onSubmit(){
      axios.post("/api/user/p1",{
        name:this.name
      },{}).then(res=>{
        console.log(res.data[0])
        alert("查询成功")
        this.tableData=res.data[0]
      })
    }
  },
  created() {
    axios.get("/api/user/searchreserve",{}).then(res=>{
      this.tableData=res.data
    })
  }


}
</script>

<style scoped>


</style>
