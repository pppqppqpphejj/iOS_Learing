//
//  OneViewController.m
//  BorderDemo
//
//  Created by 浩GG on 15/3/17.
//  Copyright (c) 2015年 YaoYu. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor yellowColor];
    
    UILabel *contentLabel=[[UILabel alloc] initWithFrame:self.view.bounds];
    contentLabel.text=@"One";
    contentLabel.textAlignment=NSTextAlignmentCenter;
    contentLabel.font=[UIFont systemFontOfSize:40.0];
    contentLabel.textColor=[UIColor blackColor];
    [self.view addSubview:contentLabel];
    
    
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
