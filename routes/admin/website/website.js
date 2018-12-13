/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-07 11:30:29
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
    if(ctx.session.userinfo.user_type!=1){//判断用户类型是否为超级管理员
        await ctx.render('/admin/website',{
            message:{"toastType":"error","title":"暂无权限","message":"您不是超级管理员暂时没有权限修改站点信息！"}
        });  
    }else {
        let logo=ctx.req.file? ctx.req.file.path.substr(7) :'';
        let title=ctx.req.body.title;
        let keywords=ctx.req.body.keywords;
        let content=ctx.req.body.content;
        let record=ctx.req.body.record;
        let copyright=ctx.req.body.copyright;
        var id = null;
        var sql='insert into `website` (id,title,logo,keywords,content,record,copyright) value (?,?,?,?,?,?,?)';
        var result=await DB.query(sql,[id,title,logo,keywords,content,record,copyright]);
        if (result){
            await ctx.redirect(ctx.state.__HOST__+'/admin/website',{
                message:{"toastType":"success","title":"修改成功","message":"站点信息更新成功！"}
            });
        }
    }
})
router.post('/doedit',tools.multer().single('logo'),async(ctx)=>{
    if(ctx.session.userinfo.user_type!=1){//判断用户类型是否为超级管理员
        await ctx.render('admin/website/website',{
            message:{"toastType":"error","title":"暂无权限","message":"您不是超级管理员暂时没有权限修改站点信息！"}
        })
    }else {
        let logo=ctx.req.file? ctx.req.file.path.substr(7) :'';
        let title=ctx.req.body.title;
        let keywords=ctx.req.body.keywords;
        let content=ctx.req.body.content;
        let record=ctx.req.body.record;
        let copyright=ctx.req.body.copyright;
        var result;
        if(logo){
            var sql='update `website` set title=?,logo=?,keywords=?,content=?,record=?,copyright=? where id=1';
            result=await DB.query(sql,[title,logo,keywords,content,record,copyright]);
        } else {
            var sql='update `website` set title=?,keywords=?,content=?,record=?,copyright=? where id=1';
            result=await DB.query(sql,[title,keywords,content,record,copyright]);
        }
        if (result){
            ctx.redirect(ctx.state.__HOST__+'/admin/website',{
                message:{"toastType":"success","title":"修改成功","message":"站点信息更新成功！"}
            });
        }
    }
})
module.exports=router.routes();