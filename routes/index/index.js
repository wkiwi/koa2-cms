/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-12-09 19:35:43
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-20 11:12:24
 */

var router=require('koa-router')();

var DB=require('../../module/mysqlDB.js');

var tools=require('../../module/tools.js');

var url= require('url');

var login = require('./login.js');

var article = require('./article.js');

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
    console.log(advlist)
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

router.use('/article',article);

router.use('',login);

module.exports=router.routes();