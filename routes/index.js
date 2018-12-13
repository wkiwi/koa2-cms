/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 17:37:06
 */

var router=require('koa-router')();

var url= require('url');

var index =require('./index/index.js');


// app.use(async (ctx,next) => {
//   next();
//   if(ctx.status == 404) {
//     ctx.status = 404;
//     await ctx.render('public/404')
//   }else {
//     // next();
//   }
// })

router.use(async(ctx,next)=>{
    //全局配置变量
    ctx.state.__HOST__='http://'+ctx.request.header.host;
    var pathname=url.parse(ctx.request.url).pathname.substring(1);
    console.log(pathname.split('/'));
    //左侧选中
    var splitUrl=pathname.split('/');
    //配置全局信息
    ctx.state.G={
        url:splitUrl,
        userinfo:ctx.session.userinfo,
        prevPage:ctx.request.headers['referer']
    }
    await  next();
})


router.use(async(ctx,next)=>{
   var pathname=url.parse(ctx.request.url).pathname;
    //全局配置变量
    console.log(pathname)
    ctx.state.pathname=pathname;
    await next();
})

// router.get('/',async(ctx)=>{
//    // ctx.body='前台首页';
//     ctx.render('default/index',{
//         focus:'首页'
//     })
// })

router.use('',index);

module.exports=router.routes();