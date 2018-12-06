/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-04 17:21:13
 */

var router=require('koa-router')();

var index =require('./admin/index.js');

var login =require('./admin/login.js');

var url = require('url');

var ueditor = require('koa2-ueditor');

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
    if(ctx.session.userinfo){
        await  next();
    }else{
        if(pathname=='admin/login'||pathname=='admin/login/doLogin'||pathname=='admin/login/code'||pathname=='admin/favicon.ico'){
            await  next();
         }else{
            ctx.redirect('/admin/login')
         }
    }
})    

router.use('',index);
router.use('/login',login);
router.all('/editor/controller', ueditor(['public', {
    "imageAllowFiles": [".png", ".jpg", ".jpeg"],
    "imagePathFormat": "/upload/ueditor/image/{yyyy}{mm}{dd}/{filename}"
}]))

module.exports=router.routes();