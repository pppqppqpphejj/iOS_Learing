//
//  UITopBanner.h
//  GroupDeal
//
//  Created by lewang on 14-5-10.
//  Copyright (c) 2014年 groupdeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITopBanner : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIButton *btnGoback;
@property (strong, nonatomic) IBOutlet UILabel *lalTitel;
@property (weak,   nonatomic) UINavigationController *parentController;
@end

@interface UIBackButton : UIButton


@end
