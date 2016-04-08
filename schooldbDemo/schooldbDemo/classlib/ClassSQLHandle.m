//
//  ClassSQLHandle.m
//  schooldbDemo
//
//  Created by 邵瑞 on 16/4/8.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ClassSQLHandle.h"
#import <sqlite3.h>
#import "URLPathDB.h"
@implementation ClassSQLHandle
//单列
ClassSQLHandle * share_SDK;

//需要使用同一个database
sqlite3 *database;

+(ClassSQLHandle *)shareDataBase
{
    
    @synchronized(self)
    
    {
    if (!share_SDK) {
        share_SDK = [[ClassSQLHandle alloc] init];
    }
    }
    return share_SDK;
    
}
-(BOOL)openDb:(NSString *)dbname{
    
    BOOL open = NO;
        //取得数据库保存路径，通常保存沙盒Documents目录
    NSString *database_path = [[NSBundle mainBundle] pathForResource: dbpath ofType:nil];

//    NSString *directory=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    NSLog(@"%@",directory);
//
//    NSString *filePath=[directory stringByAppendingPathComponent:dbname];
        //如果有数据库则直接打开，否则创建并打开（注意filePath是ObjC中的字符串，需要转化为C语言字符串类型）
    if (SQLITE_OK == sqlite3_open(database_path.UTF8String, &database))
    {
        open = YES;
        NSLog(@"数据库打开成功!");
    }else{
        open= NO;
        NSLog(@"数据库打开失败!");
    }
    
    
    
    return open;
}

-(NSArray *)executeQuery:(NSString *)sqlQuery{

    NSMutableArray *rows = [NSMutableArray array];//数据行
    char * errmsg = NULL;
    sqlite3_stmt *statement;
    if(SQLITE_OK == sqlite3_prepare_v2(database, [sqlQuery UTF8String], -1, &statement, &errmsg))

       {
           //单步执行sql语句
       while (SQLITE_ROW==sqlite3_step(statement)) {
           int columnCount= sqlite3_column_count(statement);
           NSMutableDictionary *dic=[NSMutableDictionary dictionary];
           for (int i=0; i<columnCount; i++) {
               const char *name= sqlite3_column_name(statement, i);//取得列名
               const unsigned char *value= sqlite3_column_text(statement, i);//取得某列的值
               dic[[NSString stringWithUTF8String:name]]=[NSString stringWithUTF8String:(const char *)value];
           }
           
           [rows addObject:dic];
       }
       
       
       sqlite3_finalize(statement);

}
    return rows;
    
}


-(BOOL)closeDataBase
{
    
    BOOL close = NO;
    
    if (SQLITE_OK == sqlite3_close(database)) {
        
        close= YES;
        NSLog(@"已关闭");
    }
    else
        {
        NSLog(@"打开成功");
        close = NO;
        }
    return  close;
}
@end
