/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:14:59
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-06 20:03:50
 */
const router=require('koa-router')();

var DB=require('../../../module/mysqlDB.js');

var tools=require('../../../module/tools.js');


router.get('/',async(ctx)=>{
    var sql='select title,id,classify from classify';
    var result=await DB.query(sql);
    var options =tools.cateToList(result);
    console.log(options)
    await ctx.render('admin/content/adddetails',{
        options:options
    })
})

router.post('/doadd',tools.multer().single('thumbnail'),async(ctx)=>{
    console.log(ctx.req.body.recommend)
    let thumbnail = ctx.req.file? ctx.req.file.path.substr(7) :'';
    let recommend = ctx.req.body.recommend || '';
    var recommendstr;
    if (recommend) {
        recommend.length==1 ? recommend=Array(recommend) : recommend=recommend;
        recommendstr = recommend.join(',');
    } else {
        recommendstr = '';
    }
    // let recommendstr = recommend.join(',');
    let classify = ctx.req.body.classify;
    let title = ctx.req.body.title||'';
    let keywords =ctx.req.body.keywords;
    let author = ctx.req.body.author||'';
    let type = ctx.req.body.type;
    let copyright = ctx.req.body.copyright||'';
    let description = ctx.req.body.description||'';
    let content = ctx.req.body.content||'';
    var id = null;
    var user_id = '0';
    var read_type = '0';
    var create_time = tools.getCurrentDate(2);
    var update_time = tools.getCurrentDate(2);
    var article_extend = '';
    var sql='insert into `article` (id,classify,user_id,title,author,copyright,keywords,description,thumbnail,recommend,content,type,read_type,create_time,update_time,article_extend) value (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ';/*SELECT @@IDENTITY */
    var result=await DB.query(sql,[id,classify,user_id,title,author,copyright,keywords,description,thumbnail,recommendstr,content,type,read_type,create_time,update_time,article_extend]);
    var article_id = result.insertId;
    if(recommend) {
        for(let i=0;i<recommend.length;i++){
            let sort_id = recommend[i];
            let id =null;
            let sql = 'insert into `recommend` (id,article_id,sort_id) value (?,?,?)';
            let result=await DB.query(sql,[id,article_id,sort_id]);
        }
    }
    await ctx.render('admin/content/adddetails')
})

router.get('/list',async(ctx)=>{
    var page=ctx.query.page||1;
    var pageSize=20;
    var sql1 = 'select count(id) from article';
    var result1=await DB.query(sql1);//查询总共有多少条
    var sql2 = 'select id,title from classify';
    var result2=await DB.query(sql2);//查询文章的所有分类
    console.log(result2)
    var count = result1[0]['count(id)'];
    if((page-1)*pageSize<count){//防止用户手动在地址栏输入页码过大
        if(page*pageSize>count){
            var sql='select * from article limit '+ (page-1)*pageSize+','+(count-(page-1)*pageSize);
        }else {
            var sql='select * from article limit '+ (page-1)*pageSize+','+pageSize;
        }
        console.log(sql)
        var result=await DB.query(sql);
        for (let i=0;i<result.length;i++){
            result[i].recommend = (result[i].recommend).split(',');
        }
        await ctx.render('admin/content/detaillist',{
            list: result,
            classify: result2,
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
    var list=await DB.query(sql);
    console.log(list[0])
    var sql1 = 'select sort_id from `recommend` where article_id ='+id;
    var recommends = await DB.query(sql1);
    var sql2='select title,id,classify from classify';
    var result=await DB.query(sql2);
    var options =tools.cateToList(result);
    console.log(options)
    await ctx.render('admin/content/editdetails',{
        options:options,
        list:list[0],
        recommends:recommends
    })
})

router.post('/doedit',tools.multer().single('thumbnail'),async(ctx)=>{
    let thumbnail = ctx.req.file? ctx.req.file.path.substr(7) :'';
    let recommend = ctx.req.body.recommend || '';
    var recommendstr;
    if (recommend) {
        recommend.length==1 ? recommend=Array(recommend) : recommend=recommend;
        recommendstr = recommend.join(',');
    } else {
        recommendstr = '';
    }
    // let recommend = ctx.req.body.recommend;
    // let recommendstr = recommend.join(',');
    let classify = ctx.req.body.classify;
    let title = ctx.req.body.title|| '';
    let keywords =ctx.req.body.keywords|| '';
    let author = ctx.req.body.author|| '';
    let type = ctx.req.body.type;
    let copyright = ctx.req.body.copyright|| '';
    let description = ctx.req.body.description|| '';
    let content = ctx.req.body.content|| '';
    var id = ctx.req.body.id;
    var user_id = '0';
    var read_type = '0';
    //var create_time = tools.getCurrentDate(2);
    var update_time = tools.getCurrentDate(2);
    var article_extend = '';
    if (thumbnail) { // 换新的封面图
        var sql='update article set classify=?,title=?,author=?,copyright=?,keywords=?,description=?,thumbnail=?,recommend=?,content=?,type=?,update_time=? where id=?';
        var result=await DB.query(sql,[classify,title,author,copyright,keywords,description,thumbnail,recommend,content,type,update_time,id]);
    } else { //不对封面图信息进行更新
        var sql='update article set classify=?,title=?,author=?,copyright=?,keywords=?,description=?,recommend=?,content=?,type=?,update_time=? where id=?';
        var result=await DB.query(sql,[classify,title,author,copyright,keywords,description,recommendstr,content,type,update_time,id]);
    }
    var article_id = id;
    if (recommend) {//有新加的则新添数据到recommend，去除的则在recommend表删除
        let sql = 'SELECT id,sort_id FROM `recommend` WHERE article_id=?';
        var recommends=await DB.query(sql,[article_id]);
        let s_arr= [];
        for(let r=0;r<recommends.length;r++){
            let s_sort_id = recommends[r].sort_id+'';
            let id = recommends[r].id;
            if(recommend.indexOf(s_sort_id)==-1) {//该推荐类删除
                let sql ='DELETE FROM recommend WHERE id=?';
                let result=await DB.query(sql,[id]);
            }
            s_arr.push(s_sort_id);
        }
        for(let i=0;i<recommend.length;i++){
            if(s_arr.indexOf(recommend[i])==-1) {//该推荐类为新添加
                let sort_id = recommend[i];
                let sql= 'insert into `recommend` (id,article_id,sort_id) value (?,?,?)';
                let result=await DB.query(sql,[null,article_id,sort_id]);
            }
        }
    } else { //去除了所有的推荐
        let sql ='DELETE FROM recommend WHERE article_id=?';
        let result=await DB.query(sql,[article_id]);
    }
    ctx.redirect(ctx.state.__HOST__+'/admin/content/list');
})
module.exports=router.routes();