<template>
  <el-form :inline="true" class="demo-form-inline">
    <el-form-item>
      <el-button type="primary" @click="add">增加</el-button>
    </el-form-item>
    <!--        修改1：分页方式 请求分页-->
    <el-table
        :data="tableData"
        style="width: 100%;" >
      <el-table-column
          prop="cname"
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
          <el-button @click.native.prevent="seeRow(scope.$index)" type="text" size="small">查看</el-button>
          <el-button @click.native.prevent="deleteRow(scope.$index)" type="text" size="small">退房</el-button>
        </template>
      </el-table-column>
    </el-table>


    <!--查看信息弹窗-->
    <el-dialog title="详细信息" :visible.sync="seeVisible" width="60%">
      <el-descriptions title="用户信息" border>
        <el-descriptions-item label="消费">{{cost}}</el-descriptions-item>
      </el-descriptions>
    </el-dialog>

    <!--增加信息弹窗-->
    <el-dialog title="顾客信息填写" :visible.sync="addVisible">
      <el-form :model="form_add">
        <el-form-item label="姓名" :label-width="formLabelWidth">
          <el-input v-model="form_add.cname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="房间编号" :label-width="formLabelWidth">
          <el-input v-model="form_add.rid" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="联系方式" :label-width="formLabelWidth">
          <el-input v-model="form_add.phonenum" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="入住实践" :label-width="formLabelWidth">
          <el-input v-model="form_add.time" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submit_add">提交</el-button>
      </div>
    </el-dialog>

  </el-form>
</template>
<script>
export default {
  name: "customer_table",
  data() {
    return {
      seeVisible:false,
      addVisible:false,
      cost_index:'',
      cost:'',
      tableData: [
      ],
      form_add: {
        cname: '',
        time: '',
        rid:'',
        phonenum:'',
      },
      formLabelWidth: '120px'
    }
  },
  methods: {
    seeRow(index){
      this.cost=this.tableData[index].cost
      this.seeVisible=true
    },
    deleteRow(index){
      axios.post("/api/user/deletecustomer",{
        mname:this.tableData[index].cname
      }).then(res=>{
        alert("删除成功")
        this.tableData.splice(index,1)
      })
    },
    add(){
      this.addVisible=true
    },
    submit_add(){
      axios.post("/api/user/addcustomer",{
        phonenum:this.form_add.phonenum,
        time:this.form_add.time,
        rid:this.form_add.rid,
        cname:this.form_add.mname
      }).then(res=>{
        alert("添加成功")
      })
    }
  },
  created() {
    axios.get("/api/user/searchcustomer",{}).then(res=>{
      this.tableData=res.data
      console.log(res)
    })
  }

}
</script>

<style scoped>


</style>
