/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:28:32
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-03 21:16:57
 */

const router=require('koa-router')();

var tools=require('../../../module/tools.js');

var DB=require('../../../module/mysqlDB.js');

router.get('/',async(ctx)=>{
    var sql='select title,id from nav where classify = 0';
    var result=await DB.query(sql);
    await ctx.render('admin/website/addnavigation',{
        list: result
    })
})

router.get('/list',async(ctx)=>{
    var sql='select * from nav';
    var result=await DB.query(sql);
    await ctx.render('admin/website/navigationlist',{
        list: tools.cateToList(result),
    })
})

router.get('/edit',async(ctx)=>{
    var sql1='select title,id from nav where classify = 0';
    var result1=await DB.query(sql1);//所有一级分类
    console.log(result1)
    var collection=ctx.query.collection;//数据库表
    var id=ctx.query.id;//删除的id
    var sql='select * from '+collection +' where id = '+ id;
    var result=await DB.query(sql);
    console.log(result)
    await ctx.render('admin/website/editnavigation',{
        list: result[0],
        options: result1
    })
})

router.post('/doadd',async(ctx)=>{
    console.log("doadd")
    console.log(ctx.request.body)
    let title=ctx.request.body.title;
    let keywords=ctx.request.body.keywords;
    let sort=ctx.request.body.sort;
    let classify=ctx.request.body.classify;
    let type=ctx.request.body.type;
    let link=ctx.request.body.link;
    var id = null;
    var sql='insert into `nav` (id,title,link,sort,keywords,type,classify) value (?,?,?,?,?,?,?)';
    var result=await DB.query(sql,[id,title,link,sort,keywords,type,classify]);
    ctx.redirect(ctx.state.__HOST__+'/admin/website/nav');

})

router.post('/doedit',async(ctx)=>{
    let id = ctx.request.body.id;
    let title=ctx.request.body.title;
    let keywords=ctx.request.body.keywords;
    let sort=ctx.request.body.sort;
    let classify=ctx.request.body.classify;
    let type=ctx.request.body.type;
    let link=ctx.request.body.link;
    var sql='update nav set title=?,link=?,sort=?,keywords=?,type=?,classify=? where id=?';
    var result=await DB.query(sql,[title,link,sort,keywords,type,classify,id]);
    if (result) {
        ctx.redirect(ctx.state.__HOST__+'/admin/website/nav/list');
    }
})

module.exports=router.routes();