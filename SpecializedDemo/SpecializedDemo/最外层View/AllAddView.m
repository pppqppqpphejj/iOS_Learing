//
//  AllAddView.m
//  SpecializedDemo
//
//  Created by 邵瑞 on 15/12/17.
//  Copyright © 2015年 wondersInfo. All rights reserved.
//

#import "AllAddView.h"
#import "LinkPathMacro.h"

static AllAddView * _AddView;

@implementation AllAddView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(AllAddView *)shareAllView
{
    @synchronized(self) {
        if (!_AddView)
        {
            //该方法会调用 allocWithZone
            _AddView = [[AllAddView alloc] init];
        }

    }
        return _AddView;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        

    }
    return self;
}
+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (!_AddView)
        {
            _AddView = [super allocWithZone:zone]; //确保使用同一块内存地址
            return _AddView;
        }
    }
    
    return nil;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    CGRect make = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT/2);

    self.backgroundColor = [UIColor redColor];

    
    
    return self;

    
}


@end
