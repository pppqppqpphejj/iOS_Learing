//
//  ViewController.m
//  GetPhoneNumber
//
//  Created by 邵瑞 on 16/3/17.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"
extern NSString *CTSettingCopyMyPhoneNumber();
@interface ViewController ()

@end

@implementation ViewController
-(NSString *)myNumber{
    return CTSettingCopyMyPhoneNumber();
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * sss  =[self myNumber];
    NSLog(@"%@",sss);
    
    NSString *number = [[NSUserDefaults standardUserDefaults] valueForKey:@"SBFormattedPhoneNumber"];
    
    NSLog(@"%@",number);

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
