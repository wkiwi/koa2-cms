/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-01 20:46:54
 */

var router=require('koa-router')();
var DB=require('../module/mysqlDB.js');
var url= require('url');
var http = require('http');

router.get('/',async(ctx)=>{
    ctx.body={'title':'这是一个api接口'};
})

router.get('/select',async (ctx)=>{
    var sql='select * from user';
    var result=await DB.query(sql);
    ctx.body=result;
    console.log(result.length)
    console.log(result);
    // await ctx.render('./api/index',{
    //     list:result
    // })
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