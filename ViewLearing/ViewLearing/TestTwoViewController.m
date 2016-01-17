//
//  TestTwoViewController.m
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/18.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "TestTwoViewController.h"
#import "TopNavView.h"
@interface TestTwoViewController ()
@property (weak, nonatomic) IBOutlet TopNavView *TopNav;

@end

@implementation TestTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self.TopNav.lalTopTitel setText:@"two111"];
    [self.TopNav.btnTopGoback setTitle:@"twoback" forState:UIControlStateNormal];
    [self.TopNav.btnTopGoback setHidden: NO];
    [self.TopNav.btnTopGoback removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
    [self.TopNav.btnTopGoback addTarget:self action:@selector(btnTopGoback:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [self.view addSubview:self.viewCl];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnTopGoback:(id)sender
{
    NSLog(@"self.TopNav.btnTopGoback.frame %@",NSStringFromCGRect(self.TopNav.btnTopGoback.frame));
    [self.TopNav viewPop:self ParentModelOrParentPop:YES Animated:NO];


    // Do any additional setup after loading the view from its nib.
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
