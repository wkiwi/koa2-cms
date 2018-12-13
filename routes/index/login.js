/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-12-09 19:35:43
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 09:53:36
 */

var router=require('koa-router')();

var DB=require('../../module/mysqlDB.js');

var tools=require('../../module/tools.js');

var url= require('url');

const svgCaptcha = require('svg-captcha');

router.get('/code',async(ctx)=>{
  //ctx.body='验证码';
  var captcha = svgCaptcha.create({
      size: 4 ,
      fontSize:50,
      width:100,
      height:55,
      ignoreChars: '0o1i' ,
      noise: 2 ,
      color: true ,
      background: '#ffe400'
  });
  console.log(captcha.text);
  ctx.session.code=captcha.text;//保存验证码
  ctx.body=captcha.data;
  ctx.response.type='image/svg+xml';
})

router.get('/login',async(ctx)=>{
  ctx.render('default/login')
})

router.post('/doLogin',async(ctx)=>{

 let username=ctx.request.body.user_name
 let password=ctx.request.body.pass_word
 let code=ctx.request.body.code
 console.log(code)
 console.log(ctx.session.code)
 if(code.toLowerCase()==ctx.session.code.toLowerCase()){
     var sql='select * from `user` where user_name=? AND pass_word=? AND user_type!=0';
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
         ctx.redirect(ctx.state.__HOST__)
     }else{
         console.log("失败")
         ctx.render('public/error',{
             message:'用户名或密码错误',
             redirect:ctx.state.__HOST__+'/login'
         })
     }
 }else{
     console.log("验证码失败")
         ctx.render('public/error',{
             message:'验证码错误',
             redirect:ctx.state.__HOST__+'/login'
         })
 }
})

router.get('/register',async(ctx)=>{
  ctx.render('default/register')
})

router.get('/registerUsername',async(ctx)=>{
    var username=ctx.query.username;
    var sql='select id from `user` where user_name=?';
    var result=await DB.query(sql,[username]);
    if(result.length>0){//已被注册
        ctx.body={"er_code":10000,"err_msg":"请求成功","data":{'canRegister':false}};
    } else { //可以注册
        ctx.body={"er_code":10000,"err_msg":"请求成功","data":{'canRegister':true}};
    }
})
router.post('/doRegister',async(ctx)=>{
  let username=ctx.request.body.user_name
  let password=ctx.request.body.pass_word
  let rpassword=ctx.request.body.r_pass_word
  let email=ctx.request.body.user_email
  let code=ctx.request.body.code
  var pass_word = tools.md5(password);
  if(code.toLowerCase()==ctx.session.code.toLowerCase()){
      if (password == rpassword) {
        if(!tools.hasSpecialCharacter(username)&&!tools.isEmojiCharacter(username)&&!tools.hasSpecialCharacter(password)&&!tools.isEmojiCharacter(password)&&!tools.isEmojiCharacter(email)){
          if(password.length>5){
                let create_time= tools.getCurrentDate(2);
                let update_time = create_time;
                let login_ip = tools.getClientIP(ctx);
                let user_pic = 'default/images/avator.jpg';
                let id = null;
                let user_extend = '';
                var sql='insert into `user` (id,user_name,pass_word,user_type,user_email,create_time,login_ip,update_time,user_pic,user_extend) value (?,?,?,?,?,?,?,?,?,?)';
                var result=await DB.query(sql,[id,username,pass_word,4,email,create_time,login_ip,update_time,user_pic,user_extend]);
                console.log(result)
                if(result.insertId) {
                    ctx.redirect(ctx.state.__HOST__)
                }
            }else {
                ctx.render('public/error',{
                    message:'密码至少6位',
                    redirect:ctx.state.__HOST__+'/login'
                })
            }
        }else {
          ctx.render('public/error',{
            message:'表单含有特殊字符',
            redirect:ctx.state.__HOST__+'/login'
          })
        }
      }else {
        ctx.render('public/error',{
            message:'两次密码不一致',
            redirect:ctx.state.__HOST__+'/login'
        })
      }
  }else{
      console.log("验证码失败")
          ctx.render('public/error',{
              message:'验证码错误',
              redirect:ctx.state.__HOST__+'/login'
          })
  }
 })

router.get('/loginOut',async(ctx)=>{
  ctx.session.userinfo=null;
  ctx.redirect(ctx.state.__HOST__+'/login')
})
module.exports=router.routes();