/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-28 09:29:23
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 15:02:27
 */

const router=require('koa-router')();

var banner=require('./banner.js');

var link=require('./link.js');

var nav=require('./nav.js');

var adv=require('./adv.js');

var website=require('./website.js');

router.use('',website);

router.use('/banner',banner);

router.use('/link',link);

router.use('/nav',nav);

router.use('/adv',adv);

module.exports=router.routes();