/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-11-28 14:26:12
 */
const router=require('koa-router')();

router.get('/',async(ctx)=>{
    await ctx.render('admin/system/history')
})


module.exports=router.routes();