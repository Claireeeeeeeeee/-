<template>
  <el-main>
    <el-row :gutter="20">
      <el-col :span="8"><div class="grid-content bg-purple">
        <el-tag>厨师</el-tag>
        <div style="padding: 5px">
          <el-table
              :data="tableData0"
              border
              style="width: 100%">
            <el-table-column
                prop="eid"
                label="员工号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="ename"
                label="员工名"
                width="150">
            </el-table-column>
            <el-table-column
                prop="salary"
                label="薪资"
                width="150">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
      <el-col :span="8"><div class="grid-content bg-purple">
        <el-tag>维修工</el-tag>
        <div style="padding: 5px">
          <el-table
              :data="tableData1"
              border
              style="width: 100%">
            <el-table-column
                prop="eid"
                label="员工号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="ename"
                label="员工名"
                width="150">
            </el-table-column>
            <el-table-column
                prop="salary"
                label="薪资"
                width="150">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
      <el-col :span="8"><div class="grid-content bg-purple">
        <el-tag>清洁工</el-tag>
        <div style="padding: 5px">
          <el-table
              :data="tableData2"
              border
              style="width: 100%">
            <el-table-column
                prop="eid"
                label="员工号"
                width="150">
            </el-table-column>
            <el-table-column
                prop="ename"
                label="员工名"
                width="150">
            </el-table-column>
            <el-table-column
                prop="salary"
                label="薪资"
                width="150">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
    </el-row>
    <el-row>
      <el-col :span="24"><div class="grid-content bg-purple-dark">
        <el-table
            :data="tableData_total"
            style="width: 100%">
          <el-table-column
              prop="eid"
              label="员工号"
              width="180">
          </el-table-column>
          <el-table-column
              prop="ename"
              label="员工名"
              width="180">
          </el-table-column>
          <el-table-column
              prop="department"
              label="部门"
              width="180">
          </el-table-column>
          <el-table-column
              prop="salary"
              label="薪资"
              width="180">
          </el-table-column>
          <el-table-column
              label="操作"
              align="center"
              width="200">
            <template slot-scope="scope">
              <el-button @click.native.prevent="deal(scope.$index)" type="text" size="small">解雇</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div></el-col>
    </el-row>
  </el-main>
</template>

<script>
export default {
  name: "employee_manage",
  data(){
    return{
      tableData0:[],
      tableData1:[],
      tableData2:[],
      tableData_total:[],
    }

  },
  methods:{
    deal(index){
      axios.post("/api/user/delete_emp",{
        eid:this.tableData_total[index].eid
      },{}).then(res=>{
        alert("解雇")
        this.tableData_total.splice(index,1)
      })
    }
  },
  created() {
    axios.get("/api/user/search_emp",{}).then(res=>{
      this.tableData_total=res.data
    })
    axios.get("/api/user/searchcooker",{}).then(res=>{
      this.tableData0=res.data
    })
    axios.get("/api/user/searchfixer",{}).then(res=>{
      this.tableData1=res.data
    })
    axios.get("/api/user/searchcleaner",{}).then(res=>{
      this.tableData2=res.data
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
