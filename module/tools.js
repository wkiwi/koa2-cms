/*
* @Author: Wkiwi
* @Date:   2018-08-09 11:05:04
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-05 15:11:52
*/

var md5 = require('md5');
const multer = require('koa-multer');
const file= require('file');

let tools={
    multer(){
            //配置
        var storage = multer.diskStorage({
            //文件保存路径
        destination: function (req, file, cb) {
            cb(null, 'public/upload') //注意路径必须存在
        },
        //修改文件名称
        filename: function (req, file, cb) {
            var fileFormat = (file.originalname).split(".");//获取后缀名
            cb(null,Date.now() + "." + fileFormat[fileFormat.length - 1]);
            }
        })
        var upload=multer({storage:storage});
        return upload;
    },
    md5(str){
        return md5(str);
    },
    getTime(){
        return new Date();
    }
}
module.exports=tools;