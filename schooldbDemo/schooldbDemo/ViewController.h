//
//  ViewController.h
//  schooldbDemo
//
//  Created by 邵瑞 on 16/4/8.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
/**头部搜索空件**/
@property (weak, nonatomic) IBOutlet UISearchBar *search;
/**搜索控件**/
@property (weak, nonatomic) IBOutlet UITableView *tabView;

@end

