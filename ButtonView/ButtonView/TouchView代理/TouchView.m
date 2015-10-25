//
//  TouchView.m
//  ButtonView
//
//  Created by 邵瑞 on 15/10/24.
//  Copyright © 2015年 wonders_ButtonView. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
  

// Drawing code
}

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:self repeats:YES];
//
//    }
//
//    return self;
//}
-(instancetype)init
{
    
    self = [super init];
    
    if (self ){
        NSLog(@"instance %@ has been created!", self);
//        _timer =
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeSelfBGImage:) userInfo:nil repeats:YES];

    }
    return self;
}


- (void)timerAction:(NSTimer*)timer
{
    NSLog(@"Hi, Timer Action for instance %@", self);
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [_delegate changColor:self];
//}
-(void)changeSelfBGImage:(id)sender
{
    [_delegate changSelfBGImage:self];
}

-(void)change:(id)sender
{
//    NSLog(@"1");
//    NSLog(@"Hi, Timer Action for instance %@", self);

    [_delegate changColor:self];
}

@end
