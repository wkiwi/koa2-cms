/*
* @Author: Wkiwi
* @Date:   2018-11-15 16:08:31
* @Last Modified by:   Wkiwi
* @Last Modified time: 2018-11-15 16:11:12
*/
/************常用sql***************/
//数据表sql
// 创建数据库
CREATE TABLE IF NOT EXISTS user(
    id INT(5) NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

// 查询数据表
const QUERY_TABLE = (tableName) => `SELECT * FROM ${tableName};`

// 插入数据
const INSERT_TABLE = (tableName, {key, val}) => `INSERT INTO ${tableName}(${key}) VALUES (${val});`

// 更新数据
const UPDATE_TABLE = (tableName, {primaryKey, primaryVal}, {key, value}) => `UPDATE ${tableName} SET ${key}=${val} WHERE(${primaryKey}=${primaryVal});`

// 删除数据
const DELETE_TABLE = (tableName, {primaryKey, primaryVal}) => `DELETE FROM user WHERE(${primaryKey}=${primaryVal});`

module.exports = {
    QUERY_TABLE,
    INSERT_TABLE,
    UPDATE_TABLE,
    DELETE_TABLE
}