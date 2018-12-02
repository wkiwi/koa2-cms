/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-02 18:31:38
 */
var router=require('koa-router')();

var DB=require('../../module/mysqlDB.js');

var content=require('./content/index.js');

var system =require('./system/index.js');

var user =require('./user/index.js');

var website =require('./website/index.js');

router.get('/',async(ctx)=>{
  console.log(ctx.session.userinfo)
  await ctx.render('admin/index')
})
router.get('/index',async(ctx)=>{
  await ctx.render('admin/index')
})
router.get('/changetype',async(ctx)=>{
  console.log(ctx.query)
  var sql;
  var collectionName=ctx.query.collectionName;//数据库表
  var attr=ctx.query.attr;//属性
  var id=ctx.query.id;//id
  var sql1='select * from '+collectionName+' where id = '+id;
  console.log(123)
  console.log(sql1);
  var result=await DB.query(sql1);
  if (result.length>0){
      if(result[0][attr] == 1){
        sql = 'update '+collectionName+' set '+attr+'=0 where id= '+id;
        console.log(sql)
      }else {
        sql = 'update '+collectionName+' set '+attr+'=1 where id= '+id;
        console.log(sql)
      }
      let updateResult= await DB.query(sql);
      if(updateResult){
        ctx.body={"message":'更新成功',"success":true};
      }else{
        ctx.body={"message":"更新失败","success":false}
      }
  }else {
    ctx.body={"message":'更新失败,参数错误',"success":false};
    
  }
})

router.get('/changeSort',async(ctx)=>{

  var collectionName=ctx.query.collectionName;//数据库表
  var sortValue=ctx.query.sortValue;//属性
  var id=ctx.query.id;//id
  var data=await DB.find(collectionName,{"_id":DB.getObjectId(id)} )

  var json={
      sort:sortValue
  }
  let updateResult=await DB.update(collectionName,{"_id":DB.getObjectId(id)},json);
  if(updateResult){
          ctx.body={"message":'更新成功',"success":true};
  }else{
      ctx.body={"message":"更新失败","success":false}
  }

})
router.get('/remove',async(ctx)=>{//删除该行信息
  try{
      var collection=ctx.query.collection;//数据库表
      var id=ctx.query.id;//删除的idid
      console.log(collection)
      console.log(id)
      var sql='delete from '+collection+' where id = '+id;
      console.log(sql)
      var result=await DB.query(sql);
      console.log(result);
      ctx.redirect(ctx.state.G.prevPage)
  }catch(err){
      ctx.redirect(ctx.state.G.prevPage)
  }
})
router.use('/content',content);
router.use('/user',user);
router.use('/website',website);
router.use('/system',system);
module.exports=router.routes();