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


    NSString *directory=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@",directory);
//
    NSString *filePath=[directory stringByAppendingPathComponent:dbname];
    
    NSFileManager *fm = [NSFileManager defaultManager];
        //判断document中是否有sqlite文件
    if (![fm fileExistsAtPath:filePath])
        {
            //获取在*.app中sqlite文件的路径
        NSString *boundlePath = [[NSBundle mainBundle] pathForResource:dbname ofType:nil];
        NSError *error = nil;
            //将*.app中sqlite文件复制一份到dbPath Documents 不可逆向
        BOOL result = [fm copyItemAtPath:boundlePath toPath:filePath error:&error];
            //若复制文件失败, 打印错误信息
        if (!result) {
            NSLog(@"%@", error);
        }
        }
        /*/Users/shaorui/Library/Developer/CoreSimulator/Devices/DC611E08-6E58-4CC3-A6BB-5D71035F3B25/data/Containers/Bundle/Application/DC5EA08C-47E7-4CAF-A46B-A825A8425962/schooldbDemo.app/schooldata.db*/
    
        /*
         /Users/shaorui/Library/Developer/CoreSimulator/Devices/DC611E08-6E58-4CC3-A6BB-5D71035F3B25/data/Containers/Data/Application/15FBBE6D-8C6E-4010-9035-8E2B1A858886/Documents
         */
    
        //如果有数据库则直接打开，否则创建并打开（注意filePath是ObjC中的字符串，需要转化为C语言字符串类型）
    
    
        //iOS 中管理文件的类, 负责复制文件, 删除文件, 移动文件


    
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

-(BOOL)createDataBase:(NSString *)FILE_NAME andType:(NSString *)type
{
    BOOL create = NO;

        //1 获取document文件夹的路径
        //参数1: 文件夹的名字 参数2: 查找域 参数3: 是否使用绝对路径
    NSString *docPath1 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        //获取数据库文件的路径
    NSString *docPath = [docPath1 stringByAppendingPathComponent:FILE_NAME];
    if (SQLITE_OK == sqlite3_open(docPath.UTF8String, &database))
        {
        create = YES;
        NSLog(@"数据库打开成功!");
        }else{
            create= NO;
            NSLog(@"数据库打开失败!");
        }
    NSLog(@"%@",docPath);

    return create;
}

-(BOOL)createTable:(NSString *)sqlTable
{
    
    BOOL table = NO;
    char *errorMsg;
    BOOL ok = sqlite3_exec(database, [sqlTable UTF8String], NULL, NULL, &errorMsg);
    if (ok)
    {
        NSLog(@"创建成功");

    }
    else
    {
    NSLog(@"创建失败");
    }
    
    
    return table;
}

-(BOOL)insertIntoDataBase:(NSString *)sqlInsert
{
    
//        rc=sqlite3_exec(db,"insert into UserInfo(ID,UserName,PassWord) values(2,'miss wang','654321')",0,0,&szErrMsg);
    char *errorMsg = NULL;

   BOOL isInsert = sqlite3_exec(database, [sqlInsert UTF8String],
                 NULL, NULL, &errorMsg);
    
    if (isInsert) {
        
        return YES;
    }
    else
        return NO;
    
    
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
        database = nil;
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
