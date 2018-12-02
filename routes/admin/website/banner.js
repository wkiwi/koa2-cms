/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:27:45
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-11-28 14:51:06
 */

const router=require('koa-router')();


router.get('/',async(ctx)=>{
    // ctx.body='轮播图设置';
    await ctx.render('admin/website/addbanner')
})

router.get('/list',async(ctx)=>{
    // ctx.body='轮播图设置';
    await ctx.render('admin/website/bannerlist')
})

module.exports=router.routes();
