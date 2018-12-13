/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-12-09 19:35:43
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 17:09:50
 */

var router=require('koa-router')();

var DB=require('../../module/mysqlDB.js');

var tools=require('../../module/tools.js');

var url= require('url');

var login = require('./login.js');


router.get('/',async(ctx)=>{
  // ctx.body='前台首页';
    let sql='select id,title,link,keywords,classify from nav WHERE type != 0  order by sort';
    let nav=await DB.query(sql);
    let navlist = tools.cateToList(nav)
    
    let sql2='select link,pic,title from `banner` WHERE type != 0  order by sort'
    let banner=await DB.query(sql2);

    let sql3='select * from `website`';
    let website=await DB.query(sql3);

    // let sql4= 'select id,classify,user_id,title,author,keywords,description,thumbnail,recommend,create_time from `article` WHERE type != 0';
    // let articlelist=await DB.query(sql4);

    let sql5= 'select id,title,keywords,classify,description from `classify` WHERE type != 0  order by sort'
    let classifylist=await DB.query(sql5);

    let sql6= 'select title,pic,link from `adv` WHERE type != 0  order by sort';
    let advlist=await DB.query(sql6);

    let sql7= 'select title,pic,link from `link` WHERE type != 0  order by sort';
    let linklist=await DB.query(sql7);

    ctx.render('default/index',{
        navlist: navlist,
        banner: banner,
        website: website[0],
        // articlelist: articlelist,
        classifylist: tools.cateToList(classifylist),
        userinfo:ctx.session.userinfo,
        advlist:advlist,
        linklist:linklist
    })
})

router.get('/article',async(ctx)=>{
    var id=ctx.query.id;
    let sql='select * from `website`';
    let website=await DB.query(sql);
    let sql2='select id,title,link,keywords,classify from nav WHERE type != 0  order by sort';
    let nav=await DB.query(sql2);
    let navlist = tools.cateToList(nav);
    // let sql3='select * from `article` WHERE id = ?';
    let sql3= 'select a.id,a.classify,a.user_id,a.title,a.author,a.copyright,a.keywords,a.description,a.thumbnail,a.recommend,a.content,a.read_type,a.create_time,a.update_time,a.article_extend,a.hits,a.comment,a.praise,c.user_name,c.user_pic,c.user_extend from article a,user c where  a.user_id=c.id  AND a.type !=0  AND a.id=?';

    let article=await DB.query(sql3,[id]);
    console.log(article)
    ctx.render('default/article',{
        website:website[0],
        navlist:navlist,
        article:article[0],
        userinfo:ctx.session.userinfo
    })
})

router.use('',login);
module.exports=router.routes();