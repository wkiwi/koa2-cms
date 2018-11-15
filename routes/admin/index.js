/*
* @Author: Wkiwi
* @Date:   2018-11-05 11:23:07
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-05 15:15:58
*/

var router=require('koa-router')();

const DB=require('../../module/mysqlDB.js');

router.get('/',async(ctx)=>{
    //ctx.body='用户管理';
    await ctx.render('admin/index')
})

module.exports=router.routes();