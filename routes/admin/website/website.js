/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-01 20:47:56
 */
const router=require('koa-router')();

var tools=require('../../../module/tools.js');

var DB=require('../../../module/mysqlDB.js');

router.get('/',async(ctx)=>{
    var sql='select * from `website`';
    var result=await DB.query(sql);
    console.log(result)
    console.log(result.length);
    if (result.length > 0) {
        console.log("已有资料");
        await ctx.render('admin/website/editwebsite',{list:result[0]});
    } else {
        console.log("没有资料");
        await ctx.render('admin/website/website')
    }
})

router.post('/doadd',tools.multer().single('logo'),async(ctx)=>{
    let logo=ctx.req.file? ctx.req.file.path.substr(7) :'';
    let title=ctx.req.body.title;
    let keywords=ctx.req.body.keywords;
    let content=ctx.req.body.content;
    let record=ctx.req.body.record;
    let copyright=ctx.req.body.copyright;
    var id = null;
    var sql='insert into `website` (id,title,logo,keywords,content,record,copyright) value (?,?,?,?,?,?,?)';
    var result=await DB.query(sql,[id,title,logo,keywords,content,record,copyright]);
    ctx.redirect(ctx.state.__HOST__+'/admin/website');

})
router.post('/doedit',tools.multer().single('logo'),async(ctx)=>{
    let logo=ctx.req.file? ctx.req.file.path.substr(7) :'';
    let title=ctx.req.body.title;
    let keywords=ctx.req.body.keywords;
    let content=ctx.req.body.content;
    let record=ctx.req.body.record;
    let copyright=ctx.req.body.copyright;
    if(logo){
        var sql='update `website` set title=?,logo=?,keywords=?,content=?,record=?,copyright=? where id=1';
        var result=await DB.query(sql,[title,logo,keywords,content,record,copyright]);
    } else {
        var sql='update `website` set title=?,keywords=?,content=?,record=?,copyright=? where id=1';
        var result=await DB.query(sql,[title,keywords,content,record,copyright]);
    }
    ctx.redirect(ctx.state.__HOST__+'/admin/website');
})
module.exports=router.routes();