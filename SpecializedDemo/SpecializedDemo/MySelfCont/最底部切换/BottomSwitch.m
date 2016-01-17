//
//  BottomSwitch.m
//  SOMPUTON
//
//  Created by 邵瑞 on 15/12/19.
//  Copyright © 2015年 journey. All rights reserved.
//

#import "MainViewController.h"
#import "FeedbackViewController.h"™
#import "UserInfoViewController.h"
#import "RootTabBarController.h"
#import "BottomSwitch.h"
#import "AppDelegate.h"
#import "CommonHead.h"
@implementation BottomSwitch



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor clearColor];
        
        
        NSArray * arr = @[@"天气",@"时景",@"排名",@"我"];
        UIButton * addBut  = [[UIButton alloc] init];
        

        
        for (int i = 0; i<arr.count; i++) {
            
            addBut  = [UIButton buttonWithType:UIButtonTypeCustom];
            [addBut setFrame:CGRectMake( ScreenWidth/arr.count*i,12, ScreenWidth/arr.count, self.frame.size.height)];
            [addBut setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
            [addBut removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
            [addBut addTarget:self action:@selector(addButActionTo:) forControlEvents:UIControlEventTouchUpInside];
            
            addBut.backgroundColor = [UIColor blueColor];
            addBut.tag = i;
            [self addSubview:addBut];

            
        }
        

        
        
    }
    return self;
}

-(void)addButActionTo:(UIButton *)tag

{

    [self.delegate selectTagView:tag.tag];
    
  
//    NSLog(@"title %@,tag  - %@",tag.titleLabel.text,[NSNumber numberWithInteger:tag.tag]);
    
}
@end
