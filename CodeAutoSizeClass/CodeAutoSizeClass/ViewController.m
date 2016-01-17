//
//  ViewController.m
//  CodeAutoSizeClass
//
//  Created by 邵瑞 on 16/1/15.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "ViewController.h"
#import "LoadingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.labTwo];
    [self.view addSubview:self.labOne];
self.labOne.text = @"  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstraints = NO  self.labOne.translatesAutoresizingMaskIntoConstrai";
    
    
    self.labOne.translatesAutoresizingMaskIntoConstraints = NO;    
    [self.labOne autoresizesSubviews];
    float  hight = [[LoadingView shareLoadingView] heightForString:self.labOne.text andWidth:400];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.labOne attribute:NSLayoutAttributeTopMargin relatedBy:1 toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1 constant:100];
//    self.labOne.lineBreakMode = NSLineBreakByWordWrapping;
    self.labOne.numberOfLines = 0;

    [self.labOne updateConstraintsIfNeeded];
    ;    [self.view addConstraint:constraint];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
