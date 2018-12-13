/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:29:23
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 14:56:35
 */
const router=require('koa-router')();

var tools=require('../../../module/tools.js');

var DB=require('../../../module/mysqlDB.js');

router.get('/',async(ctx)=>{
    await ctx.render('admin/website/addadv')
})
router.post('/doadd',tools.multer().single('pic'),async(ctx)=>{
    let pic=ctx.req.file? ctx.req.file.path.substr(7) :'';
    let title=ctx.req.body.title;
    let sort=ctx.req.body.sort;
    let link=ctx.req.body.link;
    let type=ctx.req.body.type;
    var id = null;
    var sql='insert into `adv` (id,title,sort,pic,link,type) value (?,?,?,?,?,?)';
    var result=await DB.query(sql,[id,title,sort,pic,link,type]);
    ctx.redirect(ctx.state.__HOST__+'/admin/website/adv');
})

router.get('/list',async(ctx)=>{
    var page=ctx.query.page||1;
    var pageSize=20;
    var sql1 = 'select count(id) from adv';
    var result1=await DB.query(sql1);//查询总共有多少条
    var count = result1[0]['count(id)'];
    if((page-1)*pageSize<count){//防止用户手动在地址栏输入页码过大
        if(page*pageSize>count){
            var sql='select * from adv limit '+ (page-1)*pageSize+','+(count-(page-1)*pageSize);
        }else {
            var sql='select * from adv limit '+ (page-1)*pageSize+','+pageSize;
        }
        console.log(sql)
        var result=await DB.query(sql);
        await ctx.render('admin/website/advlist',{
            list: result,
            page:page,
            totalPages: Math.ceil(count/pageSize)
        })
    }else {
        await ctx.render('public/500')
    }
})

router.get('/edit',async(ctx)=>{
    var collection=ctx.query.collection;//数据库表
    var id=ctx.query.id;//删除的id
    var sql='select * from '+collection +' where id = '+ id;
    var result=await DB.query(sql);
    await ctx.render('admin/website/editadv',{
        list: result[0]
    })
})

router.post('/doedit',tools.multer().single('pic'),async(ctx)=>{
    let pic=ctx.req.file? ctx.req.file.path.substr(7) :'';
    let title=ctx.req.body.title;
    let id=ctx.req.body.id;
    let sort=ctx.req.body.sort;
    let link=ctx.req.body.link;
    let type=ctx.req.body.type;
    console.log(ctx.req.body)
    if (pic) {
        var sql='update `adv` set title=?,sort=?,pic=?,link=?,type=? where id='+id;
        var result=await DB.query(sql,[title,sort,pic,link,type]);
    } else {
        var sql='update `adv` set title=?,sort=?,link=?,type=? where id='+id;
        var result=await DB.query(sql,[title,sort,link,type]);
    }
    ctx.redirect(ctx.state.__HOST__+'/admin/website/adv/list');
    
})
module.exports=router.routes();
