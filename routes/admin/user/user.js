/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 09:53:53
 */
const router=require('koa-router')();

var DB=require('../../../module/mysqlDB.js');

var tools=require('../../../module/tools.js');

router.get('/',async(ctx)=>{
    // ctx.body='添加人员';
    console.log(ctx.session.userinfo)
    await ctx.render('admin/user/adduser')
})

router.post('/doadd',async(ctx)=>{
    // ctx.body='添加人员';
    if(ctx.session.userinfo.user_type!=1){//判断用户类型是否为超级管理员
        await ctx.render('admin/user/adduser',{
            message:{"toastType":"error","title":"暂无权限","message":"您不是超级管理员暂时没有权限添加管理员！"}
        })
    }else {
        let user_name=ctx.request.body.user_name;
        let pass_word=tools.md5(ctx.request.body.pass_word);
        let user_type=ctx.request.body.user_type;
        let user_extend=ctx.request.body.user_extend || '';
        let create_time= tools.getCurrentDate(2);
        let update_time = create_time;
        let user_email = ctx.request.body.user_email;
        let login_ip = '';
        let user_pic = 'default/images/avator.jpg';
        var id = null;
        var sql='insert into `user` (id,user_name,pass_word,user_type,user_email,create_time,login_ip,update_time,user_pic,user_extend) value (?,?,?,?,?,?,?,?,?,?)';
        var result=await DB.query(sql,[id,user_name,pass_word,user_type,user_email,create_time,login_ip,update_time,user_pic,user_extend]);
        await ctx.render('admin/user/adduser')
    }
})

router.get('/list',async(ctx)=>{
    var page=ctx.query.page||1;
    var pageSize=10;
    var sql1 = 'select count(id) from user';
    var result1=await DB.query(sql1);//查询总共有多少条
    var count = result1[0]['count(id)'];
    if((page-1)*pageSize<count){//防止用户手动在地址栏输入页码过大
        if(page*pageSize>count){
            var sql='select * from user limit '+ (page-1)*pageSize+','+(count-(page-1)*pageSize);
        }else {
            var sql='select * from user limit '+ (page-1)*pageSize+','+pageSize;
        }
        console.log(sql)
        var result=await DB.query(sql);
        await ctx.render('admin/user/userlist',{
            list:result,
            page:page,
            totalPages: Math.ceil(count/pageSize)
        })
    }else {
        await ctx.render('public/500')
    }
})

module.exports=router.routes();