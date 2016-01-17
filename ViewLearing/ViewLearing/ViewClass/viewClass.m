//
//  viewClass.m
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/17.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "viewClass.h"

@implementation viewClass
//@synthesize frames;
//@synthesize bounds;
//@synthesize centers;

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self._viewframe setFrame:frame];
}
-(instancetype)initWithFrame:(CGRect)frame
{

    
    self = [super initWithFrame:frame];
    if (self) {
        [self INITSELFUIAwakeFromNibCODE];
        NSLog(@"=====");
    }
 
//    [self._viewframe setFrame:frame];
    return self;
}


//+(viewClass *)instanceCVHeadView
//
//{
//    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"viewClass" owner:nil options:nil];
//    return [nibView objectAtIndex:0];
//}

-(void)INITSELFUIAwakeFromNibCODE
{
    // Initialization code

    NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"viewClass" owner:self options:nil];
    self._viewframe = [nibArr objectAtIndex:0];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self._viewframe];
    
    NSDictionary * viewFrames = NSDictionaryOfVariableBindings(self._viewframe);
    
//V:  :表示垂直
//H:  :表示水平

    NSArray * arrConV =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self._viewframe]|"
                                                             options:0
                                                             metrics:nil
                                                                views:viewFrames];

    
    NSArray * arrConH =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self._viewframe]|"
                                                              options:0
                                                              metrics:nil
                                                                views:viewFrames];
    [self addConstraints:arrConV];

    [self addConstraints:arrConH];
    
    
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
