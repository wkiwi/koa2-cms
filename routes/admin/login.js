/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-07 11:21:36
 */
const router=require('koa-router')();

const tools=require('../../module/tools.js');

const DB=require('../../module/mysqlDB.js');

const svgCaptcha = require('svg-captcha');

router.get('/',async(ctx)=>{
    // ctx.body='登录';
    await ctx.render('admin/login')
})
router.post('/doLogin',async(ctx)=>{
    //ctx.body='登录';
   // await ctx.render('admin/login')
   await console.log(ctx.request.body)
   let username=ctx.request.body.username
   let password=ctx.request.body.password
   let code=ctx.request.body.code
   //console.log(tools.md5(password))
   if(code.toLowerCase()==ctx.session.code.toLowerCase()){
       var sql='select * from `user` where user_name=? AND pass_word=? AND (user_type=1 OR user_type=2)';
       var result=await DB.query(sql,[username,tools.md5(password)]);
       console.log(result)
       if(result.length>0){
           console.log('登陆成功');
           //console.log(result)
           ctx.session.userinfo=result[0];
           //更新用户表 改变用户登录时间
           let login_ip=tools.getClientIP(ctx)
           let last = tools.getCurrentDate(2);
           var sql='update `user` set update_time=?,login_ip=? where user_name=?';
           await DB.query(sql,[last,login_ip,username]);
           ctx.redirect(ctx.state.__HOST__+'/admin')
       }else{
           console.log("失败")
           //ctx.redirect('/admin/login')
           ctx.render('public/error',{
               message:'用户名或密码错误',
               redirect:ctx.state.__HOST__+'/admin/login'
           })
       }
   }else{
       console.log("验证码失败")
           ctx.render('public/error',{
               message:'验证码错误',
               redirect:ctx.state.__HOST__+'/admin/login'
           })
   }
})
router.get('/code',async(ctx)=>{
    //ctx.body='验证码';
    var captcha = svgCaptcha.create({
        size: 4 ,
        fontSize:50,
        width:120,
        height:34,
        ignoreChars: '0o1i' ,
        noise: 2 ,
        color: true ,
        background: '#cc9966'
    });
    console.log(captcha.text);
    ctx.session.code=captcha.text;//保存验证码
    ctx.body=captcha.data;
    ctx.response.type='image/svg+xml'
})
router.get('/loginOut',async(ctx)=>{
    ctx.session.userinfo=null;
    ctx.redirect(ctx.state.__HOST__+'/admin/login')
})

module.exports=router.routes();



