//
//  ButtonView.h
//  ButtonView
//
//  Created by 邵瑞 on 15/10/24.
//  Copyright © 2015年 wonders_ButtonView. All rights reserved.
//
//实现
//我们⾃自⼰己定义的视图,定义了两个实例变量,target是id类型的,也就是能 代表所有的类型,⽤用来接收⼀一个⺫⽬目标,这个⺫⽬目标是为了执⾏行action中的⽅方法的。 action是⽤用来接收传进来的我⾃自⼰己要实现的⽅方法(这⾥里是点击事件 bvButtonAction)

#import <UIKit/UIKit.h>

@interface ButtonView : UIView
{
// ⺫⽬目标实例变量
    id _target;
    // 事件实例变量
    // ⽅方法选择器类型
    SEL _action;

}
//

// 添加⺫⽬目标和事件
- (void)myAddTarget:(id)taraget action:(SEL)action;
@end
