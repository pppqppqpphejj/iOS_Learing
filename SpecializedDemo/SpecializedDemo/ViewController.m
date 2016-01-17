//
//  ViewController.m
//  SpecializedDemo
//
//  Created by 邵瑞 on 15/12/17.
//  Copyright © 2015年 wondersInfo. All rights reserved.
//

#import "ViewController.h"
#import "AllAddView.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AllAddView shareAllView] init];
//    CABasicAnimation *a = [[CABasicAnimation alloc] init];
//     Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
