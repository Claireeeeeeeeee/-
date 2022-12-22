<template>
  <el-table
      :data="tableData"
      style="width: 100%">
    <el-table-column
        prop="type"
        label="服务代号"
        width="180">
    </el-table-column>
    <el-table-column
        prop="ordername"
        label="服务种类"
        width="180">
    </el-table-column>
    <el-table-column
        label="操作"
        align="center"
        width="200">
      <template slot-scope="scope">
        <el-button @click.native.prevent="submit(scope.$index)" type="text" size="small"
        :disabled="iscustomer">提交</el-button>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
export default {
  name: "orderselect",
  data(){
    return{
      tableData:[],
      iscustomer:false,
      myName:'',
      cid:'',
      class:'',
    }
  },
  methods:{
    submit(index){
      axios.post("/api/user/addrorder",{
        type:this.tableData[index].type,
        cid:this.cid,
        class:this.tableData[index].class
      },{}).then(res=>{
        alert("提交成功")
      })
    }
  },
  created() {
    let re = new RegExp("\s?" + "name" + "=([^;]+)(;|$)")
    console.log(document.cookie.match(re)[1])
    this.myName=document.cookie.match(re)[1]
    axios.post("/api/user/searchcustomerid",{
      cname:this.myName
    },{}).then(res=>{
      console.log(res.data.length)
      console.log(res.data[0].cid)
      this.cid=res.data[0].cid
    })
    axios.get("/api/user/searchmenu",{}).then(res=>{
      this.tableData=res.data
    })
    axios.post()
  }
}
</script>

<style scoped>

</style>
