/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-04 16:12:30
 */
const router=require('koa-router')();

var DB=require('../../../module/mysqlDB.js');

var tools=require('../../../module/tools.js');

router.get('/',async(ctx)=>{
    var sql='select title,id from classify where classify = 0';
    var result=await DB.query(sql);
    await ctx.render('admin//content/addclassify',{
        list: result
    })
})

router.post('/doadd',async(ctx)=>{
    let title=ctx.request.body.title;
    let keywords=ctx.request.body.keywords;
    let sort=ctx.request.body.sort;
    let classify=ctx.request.body.classify;
    let type=ctx.request.body.type;
    let description=ctx.request.body.description;
    var id = null;
    console.log(ctx.request.body)
    var sql='insert into `classify` (id,title,sort,keywords,classify,description,type) value (?,?,?,?,?,?,?)';
    var result=await DB.query(sql,[id,title,sort,keywords,classify,description,type]);
    ctx.redirect(ctx.state.__HOST__+'/admin/content/classify');
})

router.get('/list',async(ctx)=>{
    var sql='select * from classify';
    var result=await DB.query(sql);
    await ctx.render('admin/content/classifylist',{
        list: tools.cateToList(result),
    })
})

router.get('/edit',async(ctx)=>{
    var sql1='select title,id from classify where classify = 0';
    var result1=await DB.query(sql1);//所有一级分类
    console.log(result1)
    var collection=ctx.query.collection;//数据库表
    var id=ctx.query.id;
    var sql='select * from '+collection +' where id = '+ id;
    var result=await DB.query(sql);
    console.log(result)
    await ctx.render('admin/content/editclassify',{
        list: result[0],
        options: result1
    })
})

router.post('/doedit',async(ctx)=>{
    let id=ctx.request.body.id;
    let title=ctx.request.body.title;
    let keywords=ctx.request.body.keywords;
    let sort=ctx.request.body.sort;
    let classify=ctx.request.body.classify;
    let type=ctx.request.body.type;
    let description=ctx.request.body.description;
    console.log(ctx.request.body);
    var sql='update classify set title=?,sort=?,keywords=?,classify=?,description=?,type=? where id=?';
    var result=await DB.query(sql,[title,sort,keywords,classify,description,type,id]);
    ctx.redirect(ctx.state.__HOST__+'/admin/content/classify/list');
})

module.exports=router.routes();