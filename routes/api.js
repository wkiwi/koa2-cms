/*
* @Author: Wkiwi
* @Date:   2018-11-05 11:23:07
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-15 16:33:54
*/

var router=require('koa-router')();
var DB=require('../module/mysqlDB.js');
var url= require('url');

router.get('/',async(ctx)=>{
    ctx.body={'title':'这是一个api接口'};
})

router.get('/select',async (ctx)=>{
    var sql='select * from user';
    var result=await DB.query(sql);

    await ctx.render('index',{

        list:result
    })
    //console.log(result);
})

router.get('/add',async (ctx)=>{

    var username='admin';
    var password='123456';
    var id = null;
    var sql='insert into user (id,username,password) value (?,?,?)';
    var params=[id,username,password];

    var result=await DB.query(sql,params);
    ctx.body='增加成功';

})

router.get('/edit',async (ctx)=>{
    var username='admin1';
    var password='1234567';

    var sql='update user set username=?,password=? where id=2';

    var result=await DB.query(sql,[username,password]);
    ctx.body='修改成功';
})

router.get('/delete',async (ctx)=>{
    var sql='delete from user where id = 3';
    var result=await DB.query(sql);
    ctx.body='删除成功';
})


module.exports=router.routes();