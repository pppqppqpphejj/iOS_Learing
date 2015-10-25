//
//  ButtonView.m
//  ButtonView
//
//  Created by 邵瑞 on 15/10/24.
//  Copyright © 2015年 wonders_ButtonView. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)myAddTarget:(id)taraget action:(SEL)action
{
    _target = taraget;
    _action = action;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    NSLog(@"开始点击此方法");
    // 让target执⾏行action⽅方法
    [_target performSelector:_action withObject:self];
    
//    [_target performSelector:_action withObject:_target withObject:self];
}
@end
