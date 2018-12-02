/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-11-17 14:44:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-11-23 17:26:37
 */

 
/*
mysql curd语句
 mysql增加数据：
       INSERT INTO user (username,password) value ('zhangsan','123456')
 mysql修改数据：
         update user set username='zhangsan',`password`='123456'  where id=2
 mysql删除数据：
        DELETE from user WHERE id=3
 mysql查询数据：
        SELECT * from `user` where username='admin'
*/
var mysql = require('mysql');

//建立连接的方法


function __connection(){

    var connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : 'root123',
        database : 'koacms'
    });
    connection.connect();
    return connection;
}

exports.query=function(sql,parmas=null){

        //1.获取数据库连接对象
        var connection=__connection();
        return new Promise(function(reject,resolve){

            //2、执行sql语句
            connection.query(sql,parmas, function (error, results, fields) {
                if (error) throw error;
                reject(results);

            });
            //3、关闭连接
            connection.end();
        })
}
