//
//  ItemButtion.h
//  BorderDemo
//
//  Created by 邵瑞 on 16/4/12.
//  Copyright © 2016年 YaoYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemButtion : UIButton
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIImageView *imvMain;
@property (strong, nonatomic) IBOutlet UILabel     *lalTitle;


@property (strong, nonatomic) UIImage *imHight;
@property (strong, nonatomic) UIImage *imNormal;

-(void)PlayAnimation;
@end
