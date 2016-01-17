//
//  ViewController.m
//  rebootAppleDevice
//
//  Created by 邵瑞 on 15/10/26.
//  Copyright © 2015年 wonders_RebootAppleDevice. All rights reserved.
//

#import "ViewController.h"
#include <sys/reboot.h>
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btnRebootAction:(id)sender {
    reboot(RB_HALT);
    NSLog(@"     reboot(RB_HALT) is %d",reboot(RB_HALT));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
