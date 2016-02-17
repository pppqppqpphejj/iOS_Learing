//
//  ViewController.m
//  MobilePhoneNumstart
//
//  Created by 邵瑞 on 15/11/3.
//  Copyright © 2015年 wonders_ MobilePhoneNumstart. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labPhone;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    字符穿总结
//   替换部分字符窜的处理
    NSRange  rang = NSMakeRange(0, 7);//返回一个枚举对象 不需要指针
    NSString * string = @"13983441921";
    
    NSString * fourStr = [string substringToIndex:7];
    
    NSString * start =  [string stringByReplacingCharactersInRange:rang withString:@"*******"];//替换为星号或者其他符号
    
    NSLog(@"string %@",string);
    
    NSLog(@"fourStr %@",fourStr);
    
    NSLog(@"start %@",start);


    self.labPhone.text = [NSString stringWithFormat:@"%@",start];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
