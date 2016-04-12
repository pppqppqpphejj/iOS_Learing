//
//  MainViewController.h
//  BorderDemo
//
//  Created by 浩GG on 15/3/17.
//  Copyright (c) 2015年 YaoYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"


@interface MainViewController : UIViewController<BarDelegate,UIScrollViewDelegate>
{
    BarViewController *bar_view;

    OneViewController *one_con;
    TwoViewController *two_con;
    ThreeViewController *three_con;
    FourViewController *four_con;
    FiveViewController *five_con;
    
    
    //主页
    UIViewController *current_con;
    NSInteger currentTag;
    NSMutableArray * itemArray;
    
}
@end
