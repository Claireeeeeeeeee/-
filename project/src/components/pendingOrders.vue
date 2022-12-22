<template>
  <el-main>
    <el-row :gutter="20">
      <el-col :span="8"><div class="grid-content bg-purple">
        <el-tag>订餐</el-tag>
        <div style="padding: 5px">
          <el-table
              :data="tableData0"
              border
              style="width: 100%">
            <el-table-column
                prop="oid"
                label="订单编号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="type"
                label="服务代号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="cid"
                label="客户编号">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
      <el-col :span="8"><div class="grid-content bg-purple">
        <el-tag>维修</el-tag>
        <div style="padding: 5px">
          <el-table
              :data="tableData1"
              border
              style="width: 100%">
            <el-table-column
                prop="oid"
                label="订单编号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="type"
                label="服务代号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="cid"
                label="客户编号">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
      <el-col :span="8"><div class="grid-content bg-purple">
        <el-tag>打扫</el-tag>
        <div style="padding: 5px">
          <el-table
              :data="tableData2"
              border
              style="width: 100%">
            <el-table-column
                prop="oid"
                label="订单编号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="type"
                label="服务代号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="cid"
                label="客户编号">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="12"><div class="grid-content bg-purple">
        <el-table
            :data="tableData_total"
            style="width: 100%">
          <el-table-column
              prop="oid"
              label="订单编号"
              width="150">
          </el-table-column>
          <el-table-column
              prop="type"
              label="服务代号"
              width="150">
          </el-table-column>
          <el-table-column
              prop="cid"
              label="顾客编号"
              width="150">
          </el-table-column>
          <el-table-column
              label="操作"
              align="center"
              width="150">
            <template slot-scope="scope">
              <el-button @click.native.prevent="deal(scope.$index)" type="text" size="small">处理</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div></el-col>
      <el-col :span="12"><div class="grid-content bg-purple">
        <div style="padding: 5px">
          <el-table
              :data="menu"
              style="width: 100%">
            <el-table-column
                prop="type"
                label="服务代号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="ordername"
                label="服务名称"
                width="150">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
    </el-row>
  </el-main>
</template>

<script>
export default {
  name: "pendingOrders",
  data(){
    return{
      tableData0:[],
      tableData1:[],
      tableData2:[],
      tableData_total:[],
      menu:[],
    }

  },
  methods:{
    deal(index){
      axios.post("/api/user/deleteorder",{
        oid:this.tableData_total[index].oid
      },{}).then(res=>{
        alert("已处理")
        this.tableData_total.splice(index,1)
      })
    }
  },
  created() {
    axios.get("/api/user/searchorder",{}).then(res=>{
      this.tableData_total=res.data
    })
    axios.get("/api/user/searchFood",{}).then(res=>{
      this.tableData0=res.data
    })
    axios.get("/api/user/searchClean",{}).then(res=>{
      this.tableData1=res.data
    })
    axios.get("/api/user/searchFix",{}).then(res=>{
      this.tableData2=res.data
    })
    axios.get("/api/user/searchmenu",{}).then(res=>{
      this.menu=res.data
    })
  }
}
</script>

<style scoped>
.el-row {
  margin-bottom: 20px;
&:last-child {
   margin-bottom: 0;
 }
}
.el-col {
  border-radius: 4px;
}
.bg-purple-dark {
  background: #99a9bf;
}
.bg-purple {
  background: #d3dce6;
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
</style>
