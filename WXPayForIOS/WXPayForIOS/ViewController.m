//
//  ViewController.m
//  WXPayForIOS
//
//  Created by ssiwo02 on 15/12/29.
//  Copyright © 2015年 疯狂的地垄沟. All rights reserved.
//

#import "ViewController.h"
#import "Http.h"
#import "WXApiManager.h"
#import "WXApiRequestHandler.h"


@interface ViewController ()<WXApiManagerDelegate>

@end

@implementation ViewController


#pragma mark - View Lifecycle
- (void)viewDidLoad {
    //前端与后台数据交互，前端只调用微信支付接口。
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    button1.center = CGPointMake(self.view.center.x, 100);
    [button1 setTitle:@"微信支付1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1:) forControlEvents:UIControlEventTouchUpInside];
    
    //前端模拟后台，调用微信全部的接口都在前端完成。
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 330, 200, 200)];
    button2.center = CGPointMake(self.view.center.x, 330);
    [button2 setTitle:@"微信支付2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
}


-(void)button1:(UIButton *)sender{
    [WXApiRequestHandler sendWXpay];
    
}

-(void)button2:(UIButton *)sender{
    [WXApiRequestHandler sendWXpayWithServer];
}


-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    
    return UIInterfaceOrientationMaskPortrait;
}


@end
