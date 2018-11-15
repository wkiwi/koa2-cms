/*
* @Author: Wkiwi
* @Date:   2018-11-05 11:23:07
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-05 15:16:03
*/

const router=require('koa-router')();

const tools=require('../../module/tools.js');

const DB=require('../../module/mysqlDB.js');

router.get('/',async(ctx)=>{
    // ctx.body='登录';
    await ctx.render('admin/login')
})

module.exports=router.routes();
