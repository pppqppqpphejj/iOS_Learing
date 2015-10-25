//
//  RootView.h
//  ButtonView
//
//  Created by 邵瑞 on 15/10/24.
//  Copyright © 2015年 wonders_ButtonView. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ButtonView;
@interface RootView : UIView
//设置tarage 事件 按钮
//bv是我们⾃自⼰己定义的⼀一个视图(ButtonView)
// bv 属性将要在controller中使⽤用

@property(nonatomic,retain) ButtonView * bv;
@property(nonatomic,retain) ButtonView * bvView;

@end
