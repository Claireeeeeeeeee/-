<template>
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
  </el-table>
</template>

<script>
export default {
  name: "roomstatus",
  data() {
    return {
      tableData: []
    }
  },
  created() {
    axios.get("/api/user/searchroom",{}).then(res=>{
      console.log(res.data)
      this.tableData=res.data
    })
  }
}
</script>

<style scoped>

</style>
