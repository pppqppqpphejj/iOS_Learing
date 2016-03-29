//
//  NextViewController.m
//  WChatAndQQLogin
//
//  Created by 邵瑞 on 16/3/29.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (strong,nonatomic) UIButton * btnWX;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    MyWeakObject(self);
    
    self.btnWX = [[UIButton alloc] init];
    self.btnWX.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btnWX];
    self.btnWX.translatesAutoresizingMaskIntoConstraints = NO;
    [weakSelf.btnWX  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.leading.mas_equalTo(self.view).mas_equalTo(20);
        make.top.mas_equalTo(self.view).mas_equalTo(20);
        
        make.size.mas_equalTo(CGSizeMake(80,45));
        
        
        
    }];
    
    
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
