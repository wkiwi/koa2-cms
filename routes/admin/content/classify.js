/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-11-28 09:23:16
 */
const router=require('koa-router')();

router.get('/',async(ctx)=>{
    await ctx.render('admin/content/addclassify')
})

router.get('/list',async(ctx)=>{
    await ctx.render('admin/content/classifylist')
})

module.exports=router.routes();