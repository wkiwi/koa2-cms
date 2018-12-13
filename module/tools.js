/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-12 17:52:51
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
    },
    // 公用：获取客户端IP
    getClientIP: function (ctx) {
        let req = ctx.request
        let ip = ctx.ip ||
        req.headers['x-forwarded-for'] ||
        req.ip ||
        req.connection.remoteAddress ||
        req.socket.remoteAddress ||
        req.connection.socket.remoteAddress || ''
        let arr = ip.match(/(\d{1,3}\.){3}\d{1,3}/)
        return arr ? arr[0] : ''
    },
    getCurrentDate(format){
        var now = new Date();
        var year = now.getFullYear(); //得到年份
        var month = now.getMonth();//得到月份
        var date = now.getDate();//得到日期
        var day = now.getDay();//得到周几
        var hour = now.getHours();//得到小时
        var minu = now.getMinutes();//得到分钟
        var sec = now.getSeconds();//得到秒
        month = month + 1;
        if (month < 10) month = "0" + month;
        if (date < 10) date = "0" + date;
        if (hour < 10) hour = "0" + hour;
        if (minu < 10) minu = "0" + minu;
        if (sec < 10) sec = "0" + sec;
        var time = "";
        //精确到天
        if(format==1){
            time = year + "-" + month + "-" + date;
        }
        //精确到分
        else if(format==2){
            time = year + "-" + month + "-" + date+ " " + hour + ":" + minu + ":" + sec;
        }
        return time;
    },
    cateToList(data){
        //获取一级分类
        var firstArr=[];
        for(var i=0;i<data.length;i++){
            if(data[i].classify=='0'){
                firstArr.push(data[i])
            }
        }
        //获取二级分类
        for(var i=0;i<firstArr.length;i++){
            firstArr[i].list=[];
            for(var j=0;j<data.length;j++){
                if(firstArr[i].id==data[j].classify){
                    let DATA = data[j];
                    DATA.father = firstArr[i].title;
                    firstArr[i].list.push(data[j]);
                }
            }
        }
        return firstArr;
    },
    hasSpecialCharacter(value){
        let reg = /[~#^$%&!?%*]/gi;
        if(reg.test(value)){ // 判断是否包含特殊字符
            return true;
        }else {
            return false;
        }
    },
    isEmojiCharacter(substring) { //检查是否位特殊字符
        for (var i = 0; i < substring.length; i++) {
            var hs = substring.charCodeAt(i);
            if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                var ls = substring.charCodeAt(i + 1);
                var uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                return true;
                }
            }
            } else if (substring.length > 1) {
            var ls = substring.charCodeAt(i + 1);
            if (ls == 0x20e3) {
                return true;
            }
            } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                return true;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                return true;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                return true;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                return true;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                return true;
            }
            }
        }
    }
}
module.exports=tools;