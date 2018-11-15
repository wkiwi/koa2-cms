/*
* @Author: Wkiwi
* @Date:   2018-11-05 11:23:07
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-05 14:58:47
*/

var router=require('koa-router')();
var DB=require('../module/mysqlDB.js');
var url= require('url');

router.use(async(ctx,next)=>{
   var pathname=url.parse(ctx.request.url).pathname;
    //全局配置变量
    console.log(pathname)
    ctx.state.pathname=pathname;
    await next();
})

router.get('/',async(ctx)=>{
   // ctx.body='前台首页';
    ctx.render('default/index',{
        focus:'首页'
    })
})


module.exports=router.routes();