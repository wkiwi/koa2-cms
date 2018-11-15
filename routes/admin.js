/*
* @Author: Wkiwi
* @Date:   2018-11-05 11:23:07
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-15 16:39:16
*/

var router=require('koa-router')();

var index =require('./admin/index.js');

var login =require('./admin/login.js');

router.use('',index);
router.use('/login',login);

module.exports=router.routes();