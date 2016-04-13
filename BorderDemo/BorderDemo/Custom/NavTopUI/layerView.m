//
//  layerView.m
//  E_Supermarket_Slient
//
//  Created by osoons on 15/6/12.
//  Copyright (c) 2015年 E_Supermarket_Slient. All rights reserved.
//

#import "layerView.h"

@implementation layerView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}


-(void)awakeFromNib
{
//    [self setBackgroundColor:[UIColor clearColor]];
//    
//    self.layer.masksToBounds = YES;
//    self.layer.cornerRadius = 2.0;
//    self.layer.borderWidth = 1.0;
//    self.layer.borderColor = [UIColor brownColor].CGColor;
//    [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"灰色框"]]];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor(context, 214.0/255, 214.0/255, 214.0/255, 1.0);
//    // Draw them with a 2.0 stroke width so they are a bit more visible.
//    CGContextSetLineWidth(context, 1.0);
//    
//    // Draw a single line from left to right
//    CGContextMoveToPoint(context, 0.0, 0.0);
//    CGContextAddLineToPoint(context, self.frame.size.width, 0.0);
//    CGContextStrokePath(context);
    
}
@end
