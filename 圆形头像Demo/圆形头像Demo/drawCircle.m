//
//  drawCircle.m
//  圆形头像Demo
//
//  Created by 邵瑞 on 16/1/28.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "drawCircle.h"

@implementation drawCircle
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    
        [self.imageCircle setFrame:self.frame];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    self.clipsToBounds = YES;//去除边界
    self.layer.cornerRadius =self.bounds.size.width/2;
    self.layer.masksToBounds = YES;

    self.contentMode = UIViewContentModeScaleToFill;
        //1.取得图片
    UIImage *img = [UIImage imageNamed:@"120"];
        //2.画
        //[img drawAtPoint:CGPointMake(20, 20)];//在(20,20)这个位置开始画
    
        //[img drawInRect:CGRectMake(20, 20, 100, 100)];//设置起始点，和宽高,会自动拉伸图片
    
    [img drawAsPatternInRect:rect];//不会自动拉伸图片，不够时会自动平铺，类似于格子
    
        //增加文字，也可以设置水印
    [self setBackgroundColor:[UIColor colorWithPatternImage:img]];
        //1.获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
        //2.绘制图形
    CGContextAddEllipseInRect(context,rect);
    CGContextSetLineWidth(context, 2);
    
        //3.显示在View上
    CGContextStrokePath(context);
}

-(void)setImageHttpURl:(NSString *)String isUrlNull:(NSString *)imageStr
{
    
}
-(void)addTarget:(NSSet *)actionSet and:(UIControl *)type
{
    
//    actionSet = @selector(null);
    
}
@end
