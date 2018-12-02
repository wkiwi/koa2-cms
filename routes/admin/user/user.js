/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-11-28 14:30:19
 */
const router=require('koa-router')();

router.get('/',async(ctx)=>{
    // ctx.body='添加人员';
    await ctx.render('admin/user/adduser')
})

router.get('/list',async(ctx)=>{
    // ctx.body='添加人员';
    await ctx.render('admin/user/userlist')
})

module.exports=router.routes();