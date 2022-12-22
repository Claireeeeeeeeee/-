<template>
  <el-form>
    <el-row :gutter="20">
      <el-col :span="12"><div class="grid-content bg-purple">
        <el-table
            :data="tableData"
            style="width: 100%">
          <el-table-column
              prop="rid"
              label="房间编号"
              width="180">
          </el-table-column>
          <el-table-column
              prop="status"
              label="房间状态"
              width="180">
          </el-table-column>
          <el-table-column
              label="操作"
              align="center"
              width="200">
            <template slot-scope="scope">
              <el-button @click.native.prevent="reserve(scope.$index)" type="text" size="small">预定</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div></el-col>
      <el-col :span="8"><div class="grid-content bg-purple">
        <div style="padding: 5px">
          <el-table
              :data="viewdata"
              style="width: 100%">
            <el-table-column
                prop="rclass"
                label="类型"
                width="180">
            </el-table-column>
            <el-table-column
                prop="number"
                label="房间余量"
                width="180">
            </el-table-column>
          </el-table>
        </div>
      </div></el-col>
    </el-row>



    <el-dialog title="预定信息" :visible.sync="reservevisible">
      <el-form :model="form">
        <el-form-item label="入住时间" :label-width="formLabelWidth">
          <el-input v-model="form.time" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submit">确 定</el-button>
      </div>
    </el-dialog>
  </el-form>
</template>

<script>
export default {
  name: "roomstatus",
  data(){
    return{
      form:{
        time:'',
      },
      index:'',
      reservevisible:false,
      document,
      tableData: [],
      viewdata:[],
      myName:'',
      rid:'',
      mid:'',
      mname:'',
      phonenum: '',
      formLabelWidth: '120px'
    }
  },
  methods:{
    submit(){
      console.log(this.mid)
      axios.post("/api/user/addreserve",{
        mid:this.mid,
        mname:this.myName,
        phonenum:this.phonenum,
        rid:this.rid,
        time:this.form.time
      }).then(res=>{
        this.tableData[this.index].status='reserved'
        alert("预定成功")
      })
    },
    reserve(index){
      if(this.tableData[index].status!=='empty'){
        alert("无法预定")
      }
      else{
        this.reservevisible=true
        this.rid=this.tableData[index].rid
        this.index=index
      }
    }
  },
  created() {
    let re = new RegExp("\s?" + "name" + "=([^;]+)(;|$)")
    console.log(document.cookie.match(re)[1])
    this.myName=document.cookie.match(re)[1]
    axios.get("/api/user/searchroom",{}).then(res=>{
      console.log(res.data)
      this.tableData=res.data
    })
    axios.get("/api/user/searchrestroom",{}).then(res=>{
      console.log(res.data)
      this.viewdata=res.data
    })
    axios.post("/api/user/searchMyinformation",{
      mname:this.myName
    },{}).then(res=>{
      console.log(res.data[0].mid)
      this.mid=res.data[0].mid
      this.phonenum=res.data[0].phonenum
    })
  }
}
</script>

<style>
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
