//
//  TestViewController.m
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/18.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "TestViewController.h"
#import "TopNavView.h"
@class UIBackButton;
@interface TestViewController ()
@property (weak, nonatomic) IBOutlet TopNavView *TopNav;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self.TopNav.lalTopTitel setText:@"返回111"];
//    [self.TopNav.btnTopGoback setTitle:@"返回" forState:UIControlStateNormal];
    [self.TopNav.btnTopGoback setHidden: NO];
    [self.TopNav setNoPop:NO];
    [self.TopNav setViewController:self];
    
//    [self.TopNav.btnTopGoback removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
//    [self.TopNav.btnTopGoback addTarget:self action:@selector(btnTopGoback:) forControlEvents:UIControlEventTouchUpInside];

    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
