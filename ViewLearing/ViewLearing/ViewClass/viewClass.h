//
//  viewClass.h
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/17.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface viewClass : UIView
@property (strong, nonatomic) IBOutlet UIView *_viewframe;
//+(viewClass *)instanceCVHeadView;
/**
 *frame属性指的是视图在其父视图坐标系中的位置与尺寸。在创建视图时，我们就需要在初始化方法中指定视图的frame：
// **/
//@property(nonatomic)CGRect frames;
///**
// *那么bounds属性呢？它指的是视图在其自己的坐标系中的位置与尺寸。
// **/
//@property (nonatomic) CGRect bounds;
///**
// *center属性理解起来也很简单，它就是视图的中心点在其父视图坐标系中的位置坐标。简单讲，center属性就定义了当前视图在父视图中的位置
// **/
//@property (nonatomic ) CGPoint centers;
@property (weak, nonatomic) IBOutlet UIButton *btnSetTitle;

@end
