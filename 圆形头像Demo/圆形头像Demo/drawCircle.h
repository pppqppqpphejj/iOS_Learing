//
//  drawCircle.h
//  圆形头像Demo
//
//  Created by 邵瑞 on 16/1/28.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface drawCircle : UIView
@property (strong,nonatomic) UIImageView * imageCircle;
-(void)setImageHttpURl:(NSString *)String isUrlNull:(NSString *)imageStr;
-(void)addTarget:(NSSet *)actionSet and:(UIControl*)type;
@end
