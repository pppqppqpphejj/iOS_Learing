//
//  ViewController.m
//  testLiHuaKeGu
//
//  Created by 邵瑞 on 16/3/4.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "ViewController.h"
#import "testViewController.h"
@interface ViewController ()
- (IBAction)btnPush:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPush:(id)sender {

    testViewController * testVC = [[testViewController alloc] initWithNibName:@"testViewController" bundle:nil];
    [self.navigationController pushViewController:testVC animated:YES];
}
@end
