/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-13 17:36:29
 */

var Koa=require('koa'),
    router = require('koa-router')(),
    render = require ('koa-art-template'),
    bodyParser = require('koa-bodyparser'),
    static = require('koa-static'),
    DB=require('./module/mysqlDB.js'),
    session=require('koa-session'),
    sd = require('silly-datetime'),
    jsonp = require('koa-jsonp'),
    path = require ('path'),
    logger = require('koa-logger'),
    onerror = require('koa-onerror'),
    cors = require('koa2-cors');


//引入路由模块
var  admin=require('./routes/admin.js');
var  api=require('./routes/api.js');
var  index=require('./routes/index.js');

var app = new Koa();

//配置post bodyparser的中间件
app.use(bodyParser());//配置post bodyparser的中间件
app.use(jsonp());
app.use(cors());
// app.use(logger());

app.keys = ['some secret hurr'];

const CONFIG = {
  key: 'koa:sess',
  maxAge: 864000,
  overwrite: true,
  httpOnly: true,
  signed: true,
  rolling: true,//每次请求都重新设置session
  renew: false,//session快过期重新设置session
};
app.use(session(CONFIG, app));

//配置模板引擎
render(app,{
    root:path.join(__dirname,'views'),
    extname:'.html',
    debug:process.env.NODE_ENV !== 'production',
    dateFormat:dateFormat=function(value){return sd.format(new Date(value), 'YYYY-MM-DD HH:mm');} /*扩展模板里面的方法*/
})


app.use(static(__dirname+'/public'));   //koa静态资源中间件可以配置多个



//配置路由
router.use('/admin',admin);
router.use('/api',api);
router.use(index);

app.use(router.routes());   /*启动路由*/
app.use(router.allowedMethods());

app.on('error', function(err, ctx){
  console.log(err)
  // logger.error('server error', err, ctx);
});

app.listen(3000);








