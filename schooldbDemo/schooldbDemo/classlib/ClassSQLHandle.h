//
//  ClassSQLHandle.h
//  schooldbDemo
//
//  Created by 邵瑞 on 16/4/8.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <sqlite3ext.h>
#import <sqlite3.h>
@interface ClassSQLHandle : NSObject
+(ClassSQLHandle *)shareDataBase;

/***
 * 返回数据库是否打开成功
 * dbname 数据库名称
 * bool
 ***/
-(BOOL)openDb:(NSString *)dbname;


/***
 * 创建数据库
 * dbname
 * type 后缀名
 * bool 
 ***/
-(BOOL)createDataBase:(NSString *)FILE_NAME andType:(NSString *)type;
/***
 * SQLITE 创建 TABLE
 * sqlTable　 执行
 * bool
 ***/
-(BOOL)createTable:(NSString *)sqlTable;

/***
 * 查询sql 并返回结果
 * sqlQuery  传入执行语句
 * 返回数组 
 ***/
-(NSArray *)executeQuery:(NSString *)sqlQuery;
/**关闭数据库**/

-(BOOL)closeDataBase;
@end
