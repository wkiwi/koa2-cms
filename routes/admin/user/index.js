/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:29:23
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-11-28 14:22:28
 */

const router=require('koa-router')();

var user=require('./user.js');

router.use('',user);

module.exports=router.routes();