/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-12-09 19:35:43
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-20 17:31:16
 */

var router=require('koa-router')();

var DB=require('../../module/mysqlDB.js');

var tools=require('../../module/tools.js');

var url= require('url');


router.get('/',async(ctx)=>{
    var id=ctx.query.id;
    console.log(id)
    let sql='select * from `website`';
    let website=await DB.query(sql);
    let sql2='select id,title,link,keywords,classify from nav WHERE type != 0  order by sort';
    let nav=await DB.query(sql2);
    let navlist = tools.cateToList(nav);
    // let sql3='select * from `article` WHERE id = ?';
    let sql3= 'select a.id,a.classify,a.user_id,a.title,a.author,a.copyright,a.keywords,a.description,a.thumbnail,a.recommend,a.content,a.read_type,a.create_time,a.update_time,a.article_extend,a.hits,a.comment,a.praise,c.user_name,c.user_pic,c.user_extend from article a,user c where  a.user_id=c.id  AND a.type !=0  AND a.id=?';
    let article=await DB.query(sql3,[id]);
    //console.log(article)
    let sql4= 'select a.user_name,a.user_pic,b.id,b.content,b.create_time from user a, comment b where a.id=b.user_id AND b.article_id=?';
    let recommrdlist =await DB.query(sql4,[id]);
    var  praised; 
    if (ctx.session.userinfo) {
      let user_id = ctx.session.userinfo.id;
      let sql5= 'select * from `praise` where article_id = ? AND user_id=?';
      let praiselist=await DB.query(sql5,[id,user_id]);
      console.log(praiselist.length)
      if (praiselist.length>0){
        praised = true;
      }else {
        praised = false;
      }
    }else {
      praised = false;
    }
    let sql6= 'select count(1) from praise where article_id = ?';
    let praisenumber=await DB.query(sql6,[id]);
    //console.log(praisenumber[0]['count(1)']);

    ctx.render('default/article',{
        website:website[0],
        navlist:navlist,
        article:article[0],
        userinfo:ctx.session.userinfo,
        recommrdlist:recommrdlist,
        praised:praised,
        praisenumber:praisenumber[0]['count(1)']
    })
})
router.post('/praise',async(ctx)=>{
  let user_id=ctx.request.body.userid;
  let article_id=ctx.request.body.articleid;
  console.log(user_id)
  console.log(article_id)
  let create_time= tools.getCurrentDate(2);
  let sql1= 'select id from praise WHERE user_id=? AND article_id =?';
  let result=await DB.query(sql1,[user_id,article_id]);
  if (result.length>0) {//已经点赞过
    let sql3= "DELETE from `praise` WHERE user_id=? AND article_id =?";
    let result=await DB.query(sql3,[user_id,article_id]);
    ctx.body={"er_code":10000,"err_msg":"请求成功","data":{'type':'desc'}};
  }else { //没有点赞过
    let sql2="insert into `praise` (id,article_id,user_id,create_time) value (?,?,?,?)";
    let result = await DB.query(sql2,[null,article_id,user_id,create_time]);
    if(result.insertId) {//点赞成功
      ctx.body={"er_code":10000,"err_msg":"请求成功","data":{'type':'add'}};
    }
  }
})
router.post('/comment',async(ctx)=>{
  let user_id=ctx.request.body.userid;
  let article_id=ctx.request.body.articleid;
  let content = ctx.request.body.content;
  let create_time= tools.getCurrentDate(2);
  let sql2="insert into `comment` (id,article_id,content,user_id,create_time) value (?,?,?,?,?)";
  let result = await DB.query(sql2,[null,article_id,content,user_id,create_time]);
  if(result.insertId) {//点赞成功
    ctx.body={"er_code":10000,"err_msg":"评论成功","data":{"time":create_time}};
  }
})

module.exports=router.routes();