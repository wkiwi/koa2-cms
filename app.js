/*
* @Author: Wkiwi
* @Date:   2018-11-05 11:23:07
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-15 15:57:46
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
    cors = require('koa2-cors');


var app = new Koa();

//配置post bodyparser的中间件
app.use(bodyParser());//配置post bodyparser的中间件
app.use(jsonp());
app.use(cors());
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


//引入模块
var  admin=require('./routes/admin.js');
var  api=require('./routes/api.js');
var  index=require('./routes/index.js');

//配置路由
router.use('/admin',admin);
router.use('/api',api);
router.use(index);

app.use(router.routes());   /*启动路由*/
app.use(router.allowedMethods());
app.listen(3000);








