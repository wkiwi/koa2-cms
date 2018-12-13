/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 10:22:02
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

router.get('/articlelist',async (ctx)=>{
    var page=ctx.query.page||1;
    var pageSize =20
    var classify=ctx.query.classify||0;
    var recommend=ctx.query.recommend||0;
    var articlelist;
    var result2;
    if (classify ==0 && recommend == 0){
        let sql= 'select a.id,a.classify,a.user_id,a.title,a.author,a.keywords,a.description,a.thumbnail,a.recommend,a.create_time,c.user_name,c.user_pic from article a,user c where  a.user_id=c.id  AND a.type !=0  limit '+ (page-1)*pageSize+','+pageSize;
        articlelist=await DB.query(sql);
        let sql2 = 'select count(1) from article  where  type !=0 ';
        result2=await DB.query(sql2);//查询总共有多少条
    } else if (classify!=0 && recommend != 0){
        let sql= 'select a.id,a.classify,a.user_id,a.title,a.author,a.keywords,a.description,a.thumbnail,a.recommend,a.create_time,c.user_name,c.user_pic from article a,recommend b,user c  where b.article_id=a.id AND a.user_id=c.id  AND  a.type !=0 AND a.classify=? AND b.sort_id=? limit '+ (page-1)*pageSize+','+pageSize;
        articlelist=await DB.query(sql,[classify,recommend]);
        let sql2 = 'select count(1) from article a,recommend b where b.article_id=a.id AND  a.type !=0 AND a.classify=? AND b.sort_id=?';
        result2=await DB.query(sql2,[classify,recommend]);//查询总共有多少条
    } else if (classify==0 && recommend != 0){
        let sql= 'select a.id,a.classify,a.user_id,a.title,a.author,a.keywords,a.description,a.thumbnail,a.recommend,a.create_time,c.user_name,c.user_pic from article a,recommend b,user c where b.article_id=a.id AND a.user_id=c.id AND a.type !=0  AND b.sort_id=? limit '+ (page-1)*pageSize+','+pageSize;
        articlelist=await DB.query(sql,[recommend]);
        let sql2 = 'select count(1) from article a,recommend b where b.article_id=a.id AND  a.type !=0  AND b.sort_id=?';
        result2=await DB.query(sql2,[recommend]);//查询总共有多少条
    } else if (classify !=0 && recommend == 0) {
        let sql= 'select a.id,a.classify,a.user_id,a.title,a.author,a.keywords,a.description,a.thumbnail,a.recommend,a.create_time,c.user_name,c.user_pic from article a,user c where  a.user_id=c.id AND type !=0 AND classify=?  limit '+ (page-1)*pageSize+','+pageSize;
        articlelist=await DB.query(sql,[classify]);
        let sql2 = 'select count(1) from article  where  type !=0 AND classify=?';
        result2=await DB.query(sql2,[classify]);//查询总共有多少条
    }
    let count = result2[0]['count(1)'];
    let totalPages= Math.ceil(count/pageSize)
    ctx.body={articlelist,totalPages};
})


module.exports=router.routes();