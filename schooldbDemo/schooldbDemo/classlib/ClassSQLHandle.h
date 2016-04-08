//
//  ClassSQLHandle.h
//  schooldbDemo
//
//  Created by 邵瑞 on 16/4/8.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassSQLHandle : NSObject
+(ClassSQLHandle *)shareDataBase;

/***
 * 返回数据库是否打开成功
 * dbname 数据库名称
 * bool
 ***/
-(BOOL)openDb:(NSString *)dbname;
/***
 * 查询sql 并返回结果
 * sqlQuery  传入执行语句
 * 返回数组 
 ***/
-(NSArray *)executeQuery:(NSString *)sqlQuery;
/**关闭数据库**/

-(BOOL)closeDataBase;
@end
