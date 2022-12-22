// 测试用 api 实例
var models = require('../db');
var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var $sql = require('../sqlMap');
// 连接数据库
var conn = mysql.createConnection(models.mysql);
conn.connect();
var jsonWrite = (res, ret) => {
    if (typeof ret === 'undefined') {
        res.json({
            code: '1',
            msg: '操作失败',
        });
    } else {
        res.json(ret);
    }
};
// 增加用户接口
// POST 请求


//用户登陆后获取ID
router.post('/searchMyinformation', (req, res) => {
    var sql = $sql.member.search;
    var params = req.body;
    console.log(params);
    // 自动填充到之前 ？ 里面
    conn.query(sql, [params.mname], (err, result) => {
        if (err) return console.log(err);
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//登陆注册
router.post('/addUser', (req, res) => {
    var sql = $sql.user.add;
    var params = req.body;
    console.log(params);
    // 自动填充到之前 ？ 里面
    conn.query(sql, [params.name,params.phonenum, params.password,params.identity], (err, result) => {
        if (err) return console.log(err);
        if (result) {
            jsonWrite(res, result);
        }
    });
});


router.post('/getemployee', (req, res) => {
    let sql = $sql.user.gete;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.ename,params.epassword], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});


router.post('/getmember', (req, res) => {
    let sql = $sql.user.getm;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.mname,params.mpassword], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});


//房间状态查询
router.get('/searchroom', (req, res) => {
    let sql = $sql.room.search;
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});


//线下登记与退房
router.get('/searchcustomer', (req, res) => {
    let sql = $sql.customer.search;
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

router.post('/addcustomer', (req, res) => {
    let sql = $sql.customer.add;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.phonenum,params.time,params.rid,params.mname], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

router.post('/deletecustomer', (req, res) => {
    let sql = $sql.customer.delete;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.mname], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});



//预定处理
router.get('/searchreserve', (req, res) => {
    let sql = $sql.reserve.search;
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

router.post('/addonline', (req, res) => {
    let sql = $sql.reserve.add;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.phonenum,params.time,params.rid,params.mid,params.mname], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

router.post('/deleteonline', (req, res) => {
    let sql = $sql.reserve.delete;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.mid], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});



//订单处理
router.get('/searchorder', (req, res) => {
    let sql = $sql.order.search;
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

router.post('/deleteorder', (req, res) => {
    let sql = $sql.order.delete;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.oid], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//客户预定
router.post('/addreserve', (req, res) => {
    let sql = $sql.reserve.addre;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.mid,params.mname,params.phonenum,params.rid,params.time], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});


//服务种类查询
router.get('/searchmenu', (req, res) => {
    let sql = $sql.menu.search;
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//提交服务
router.post('/addrorder', (req, res) => {
    let sql = $sql.order.add;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.type,params.cid,params.class], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//（订单时）查询顾客编号
router.post('/searchcustomerid', (req, res) => {
    let sql = $sql.customer.searchid;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.cname], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//查询订餐订单
router.get('/searchFood', (req, res) => {
    let sql = $sql.Food.search
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//查询清理订单
router.get('/searchClean', (req, res) => {
    let sql = $sql.Clean.search
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//查询维修订单
router.get('/searchFix', (req, res) => {
    let sql = $sql.Fix.search
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//陈列服务
router.get('/searchmenu', (req, res) => {
    let sql = $sql.menu.search
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//剩余房间显示
router.get('/searchrestroom', (req, res) => {
    let sql = $sql.restroom.search
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//礼物展示
router.get('/searchpresent', (req, res) => {
    let sql = $sql.present.search
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//查询礼物编号
router.post('/searchpid', (req, res) => {
    let sql = $sql.present.searchpid
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.pname], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//兑换礼物
router.post('/addpresent', (req, res) => {
    let sql = $sql.present.add;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.mid,params.pname,params.pid], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//查询礼物兑换数量
router.get('/presentNum', (req, res) => {
    let sql = $sql.presentNum.search
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//员工管理
router.get('/search_emp', (req, res) => {
    let sql = $sql.employee.search;
    let params = req.body;
    console.log(params);

    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});


router.post('/delete_emp', (req, res) => {
    let sql = $sql.employee.delete;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.eid], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});


router.post('/update_emp', (req, res) => {
    let sql = $sql.employee.update;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.ename,params.department,params.salary,params.eid], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//查询cooker
router.get('/searchcooker', (req, res) => {
    let sql = $sql.cooker.search
    let params = req.body;
    console.log(params);
    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});
router.get('/searchfixer', (req, res) => {
    let sql = $sql.fixer.search
    let params = req.body;
    console.log(params);
    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

router.get('/searchcleaner', (req, res) => {
    let sql = $sql.cleaner.search
    let params = req.body;
    console.log(params);
    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//存储过程1
router.post('/p1', (req, res) => {
    let sql = $sql.p1.search;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.name], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//存储过程2
router.post('/p2', (req, res) => {
    let sql = $sql.p.search1;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.pname], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

//存储过程3
router.post('/p3', (req, res) => {
    let sql = $sql.p.search2;
    let params = req.body;
    console.log(params);

    conn.query(sql,[params.pid], (err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});

router.get('/p4', (req, res) => {
    let sql = $sql.pnum.search_max;
    let params = req.body;
    console.log(params);

    conn.query(sql,(err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});


router.get('/p5', (req, res) => {
    let sql = $sql.pnum.search_min;
    let params = req.body;
    console.log(params);

    conn.query(sql,(err, result) => {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    });
});
module.exports = router;
