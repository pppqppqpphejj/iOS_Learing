//
//  RootView.m
//  ButtonView
//
//  Created by 邵瑞 on 15/10/24.
//  Copyright © 2015年 wonders_ButtonView. All rights reserved.
//

#import "RootView.h"
#import "ButtonView.h"
@implementation RootView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    {
        if (self) {
//            <#statements#>
            [self p_setupView];
        }
    }
    return self;
}

-(void)p_setupView
{
    self.backgroundColor = [UIColor yellowColor];
    
    self.bvView = [[ButtonView alloc] initWithFrame:CGRectMake(50, 50, 300, 100)];
    self.bvView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.bvView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
