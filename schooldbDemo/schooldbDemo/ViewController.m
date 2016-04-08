//
//  ViewController.m
//  schooldbDemo
//
//  Created by 邵瑞 on 16/4/8.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"
#import "URLPathDB.h"
#import "RootTabCell.h"
#import "ClassSQLHandle.h"
#import <sqlite3.h>
@interface ViewController ()
{
    /**单列声明**/
    ClassSQLHandle * singleOpen;
}

@property (strong,nonatomic)    NSString * databaseFilePath;
/**接受读取数据库**/
@property (strong,nonatomic)  NSArray * dbArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    singleOpen = [ClassSQLHandle shareDataBase];
            NSString *query = @"select * from univs";

    BOOL open = [singleOpen openDb:dbpath];
    
    self.dbArr =  [singleOpen executeQuery:query];
    
        NSLog(@"%@",self.dbArr);
    
    
    self.search.delegate = self;
    
    [self.search becomeFirstResponder];
    
    UINib * nibTab = [UINib nibWithNibName:NSStringFromClass([RootTabCell class]) bundle:nil];
    [self.tabView registerNib:nibTab forCellReuseIdentifier:[NSString stringWithFormat:@"%@",[RootTabCell class]]];

    self.tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tabView.dataSource = self;
    self.tabView.delegate = self;

    [self.tabView reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma  UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;

}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
//    NSString * sql = [NSString stringWithFormat:@"select * from univs  where name like '%%%@%%'",searchBar.text];

}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    
    return YES;
    
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    NSString * sql = [NSString stringWithFormat:@"select * from univs  where name like '%%@%'",searchText];

    NSString * sql = [NSString stringWithFormat:@"select * from univs  where name like '%%%@%%'",searchText];
    [self reloadDataTable:sql];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [self.view endEditing:YES];
    NSString * sql = [NSString stringWithFormat:@"select * from univs  where name like '%%%@%%'",searchBar.text];
    
    [self reloadDataTable:sql];
    
    

}
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED
{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED
{

}
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED
{

}
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{

}

#pragma  mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    

        return self.dbArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            static NSString * identifer = @"RootTabCell";
        RootTabCell * cell = (RootTabCell *)[tableView dequeueReusableCellWithIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSDictionary * dic = self.dbArr[indexPath.row];

    
    cell.labName.text = dic[@"name"];
        
            //代理方法获得点击第几张图片,如不需要可不设置
        
        
//        [cell setSchoolCount:[NSString stringWithFormat:@"已有%@家合作院校入住",schoolCount]];
    
        return cell;
        
        

    
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
 
        return 60;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma Tableview reloadData


-(void)reloadDataTable:(NSString * )search
{
    self.dbArr = nil;
    
    self.dbArr =  [singleOpen executeQuery:search];

    
    [self.tabView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
