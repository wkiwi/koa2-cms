/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-02 18:56:33
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
    }
}
module.exports=tools;