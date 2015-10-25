//
//  TouchView.h
//  ButtonView
//
//  Created by 邵瑞 on 15/10/24.
//  Copyright © 2015年 wonders_ButtonView. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchView;

@protocol TouchViewDelegate <NSObject>
//需要在添加代理的地方去实现这个方法
@required

-(void)changColor:(TouchView *)viewColor;

@optional
/*
 * @brief imageStr响应参数，self背景图片
 */
-(void)changSelfBGImage:(TouchView *)imageStr;

@end


@interface TouchView : UIView
{
    NSTimer *_timer;
}
@property (nonatomic,assign) id <TouchViewDelegate>delegate;
-(void)change;
-(void)changeSelfBGImage:(id)sender;
/*
 * @brief timer响应函数，只是用来做测试
 */
- (void)timerAction:(NSTimer*)timer;

@end
