//
//  ViewController.m
//  UIControlExample
//
//  Created by nice on 15/12/1.
//  Copyright © 2015年 iosdev. All rights reserved.
//

#import "ViewController.h"
#import "ImageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    ImageControl *control = [[ImageControl alloc] initWithFrame:(CGRect){50.0f, 100.0f, 200.0f, 300.0f} title:@"This is a demo" image:[UIImage imageNamed:@"demo"]];
    control.backgroundColor = [UIColor blueColor];
    control.clipsToBounds = YES;
    control.layer.borderWidth = 1;
    control.layer.borderColor = [UIColor lightTextColor].CGColor;
    control.center = (CGPoint){self.view.bounds.size.width / 2.0f, self.view.bounds.size.height / 2.0f};
    
    [control addTarget:self action:@selector(tapImageControl:) forControlEvents:UIControlEventTouchUpInside];
    [control addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
    // 如果我们没有指定target，则会将事件分发到响应链上第一个想处理消息的对象上
    [control addTarget:self action:@selector(tapImageControl:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:control];
    
    [control sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)tapImageControl:(id)sender {
    
    NSLog(@"sender = %@", sender);
}

- (void)touchDown:(id)sender {
    NSLog(@"touch down");
}

@end
