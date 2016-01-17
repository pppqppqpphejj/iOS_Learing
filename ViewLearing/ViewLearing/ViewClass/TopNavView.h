 //
//  TopNavView.h
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/17.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopNavView : UIView
@property (strong, nonatomic) IBOutlet UIView *TopNav;
/**
 *返回按钮
 **/
@property (strong, nonatomic) IBOutlet UIButton *btnTopGoback;
/**
 *title标题文本
 **/
@property (strong, nonatomic) IBOutlet UILabel *lalTopTitel;
/**
 *返回父视图
 **/
@property (weak,   nonatomic) UINavigationController *parentController;
/**
 *传入一个UIViewController 控制器
 * ParentModelOrParentPop 根据视图返回model或者pop返回
 * Animated可以自行code
 **/
-(void)viewPop:(UIViewController *)viewConter  ParentModelOrParentPop:(BOOL)yes Animated:(BOOL)yes;

@end
/**
 *实现返回
 **/
@interface UIBackButton : UIButton


@end

@interface UITITTLeLab :UILabel


@end