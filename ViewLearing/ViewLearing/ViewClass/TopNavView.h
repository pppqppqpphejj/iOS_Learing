 //
//  TopNavView.h
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/17.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopNavView : UIView

/**
 *传入一个UIViewController 控制器
 * noPop 根据视图返回model或者pop返回
 * Animated可以自行code预留
 **/

@property (strong,nonatomic) UIViewController * ViewController;

@property (nonatomic, getter=isPopView) BOOL noPop; // default is NO
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

@end
/**
 *实现返回
 **/
@interface UIBackButton : UIButton


@end

@interface UITITTLeLab :UILabel


@end