/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:29:23
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-11-28 14:19:19
 */

const router=require('koa-router')();


router.get('/',async(ctx)=>{
    // ctx.body='友情链接设置';
    await ctx.render('admin/website/addlink')
})

router.get('/list',async(ctx)=>{
    // ctx.body='友情链接设置';
    await ctx.render('admin/website/linklist')
})

module.exports=router.routes();