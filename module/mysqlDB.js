/*
* @Author: Wkiwi
* @Date:   2018-11-05 11:23:07
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-15 16:08:10
*/
/*
mysql curd���

 mysql�������ݣ�

       INSERT INTO user (username,password) value ('zhangsan','123456')

 mysql�޸����ݣ�
         update user set username='zhangsan',`password`='123456'  where id=2

 mysqlɾ�����ݣ�
        DELETE from user WHERE id=3

 mysql��ѯ���ݣ�
        SELECT * from `user` where username='admin'

*/
var mysql = require('mysql');

//�������ӵķ���


function __connection(){

    var connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : 'root',
        database : 'koacms'
    });
    connection.connect();
    return connection;
}

exports.query=function(sql,parmas=null){

        //1.��ȡ���ݿ����Ӷ���
        var connection=__connection();
        return new Promise(function(reject,resolve){

            //2��ִ��sql���
            connection.query(sql,parmas, function (error, results, fields) {
                if (error) throw error;
                reject(results);

            });
            //3���ر�����
            connection.end();
        })
}


