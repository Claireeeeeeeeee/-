<template>
  <el-row>
    <el-col :span="24"><div class="grid-content bg-purple-dark">
      <el-table
          :data="tableData"
          style="width: 100%">
        <el-table-column
            prop="pname"
            label="礼物"
            width="180">
        </el-table-column>
        <el-table-column
            prop="pcount"
            label="所需积分"
            width="180">
        </el-table-column>
        <el-table-column
            prop="plevel"
            label="所需等级"
            width="180">
        </el-table-column>
        <el-table-column
            label="操作"
            align="center"
            width="200">
          <template slot-scope="scope">
            <el-button @click.native.prevent="submit(scope.$index)" type="text" size="small">兑换</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div></el-col>
    <el-col :span="24"><div class="grid-content bg-purple-dark" style="padding: 5px">
      <div style="padding: 5px">
        <el-table
            :data="presentNum"
            stripe
            style="width: 100%">
          <el-table-column
              prop="pid"
              label="礼物编号"
              width="180">
          </el-table-column>
          <el-table-column
              prop="present_number"
              label="已兑换数量"
              width="180">
          </el-table-column>
        </el-table>
      </div>
    </div></el-col>
  </el-row>
</template>

<script>
export default {
  name: "historyroom",
  data(){
    return{
      tableData:[],
      presentNum:[],
      mid:'',
      pid:'',
    }
  },
  methods:{
    submit(index){
      axios.post("/api/user/searchpid",{
        pname:this.tableData[index].pname
      },{}).then(res=>{
        console.log(res.data[0].pid)
        this.pid=res.data[0].pid
        axios.post("/api/user/addpresent",{
          mid:this.mid,
          pname:this.tableData[index].pname,
          pid:this.pid
        },{}).then(res=>{
              console.log(res)
          alert("兑换成功")
            })
      })
    }
  },
  created() {
    let re = new RegExp("\s?" + "name" + "=([^;]+)(;|$)")
    console.log(document.cookie.match(re)[1])
    this.myName=document.cookie.match(re)[1]
    axios.post("/api/user/searchMyinformation",{
      mname:this.myName
    },{}).then(res=>{
      console.log(res.data.length)
      console.log(res.data[0].mid)
      this.mid=res.data[0].mid
    })
    axios.get("/api/user/searchpresent",{
    }).then(res=>{
      this.tableData=res.data
    })
    axios.get("/api/user/presentNum",{
    }).then(res=>{
      this.presentNum=res.data
    })
  }
}
</script>

<style scoped>

</style>
