module.exports = {
    user: {
        // ? 占位符 后面给数据自动填充
        add: 'insert into user(name,phonenum,password,identity) values(?,?,?,?)',
        gete: "select * from employee where ename =? and epassword=?",
        getm: "select * from member where mname =? and mpassword=?",
    },
    room:{
        search:"select * from room",
    },
    customer:{
        search: "select * from customer",
        searchid:"select cid from customer where cname=?",
        add:'insert into customer(phonenum,time,rid,cname) values(?,?,?,?)',
        delete:'DELETE FROM customer WHERE cname=?'
    },
    reserve:{
        search: "select * from reserve",
        add:'insert into customer(phonenum,time,rid,mid,cname) values(?,?,?,?,?)',
        delete:'DELETE FROM reserve WHERE mid=?',
        addre:'insert into reserve(mid,mname,phonenum,rid,time) values(?,?,?,?,?)'
    },
    order:{
        add:'insert into `order`(type,cid,class) values(?,?,?)',
        search:"SELECT * FROM `order` ",
        delete:'DELETE FROM `order` WHERE oid=?'
    },
    member:{
        search: "select * from member where mname=?",
    },
    menu:{
        search:"select * from menu"
    },
    Food:{
        search:"select * from Food"
    },
    Clean:{
        search:"select * from Clean"
    },
    Fix:{
        search:"select * from Fix"
    },
    menu:{
        search:"select * from menu"
    },
    restroom:{
        search:"select * from restroom"
    },
    present:{
        search:"select * from present",
        add:"insert into present_order(mid,pname,pid) values (?,?,?) ",
        searchpid:"select pid from present where pname=?"
    },
    presentNum:{
        search:"select * from presentnum"
    }
,
    employee: {
        delete:'DELETE FROM employee WHERE eid=?',
        search:"select * from employee",
        update:"UPDATE employee SET ename =?,department =?,salary =? where eid=?"
    },
    cooker:{
        search:"select * from cooker",
    },
    fixer:{
        search:"select * from fixer",
    },
    cleaner:{
        search:"select * from cleaner",
    },
    p1:{
        search:"call p1(?)"
    },
    p:{
        search1:"call p2(?)",
        search2:"call p3(?)"
    },
    pnum:{
        search_max:"call p4(@maxnum)",
        search_min:"call p5(@minnum)",
    }
};
