//
//  ViewController.m
//  高德室外导航
//
//  Created by 邵瑞 on 16/3/14.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
//#import "ShiWaiViewController.h"
#import "TwoViewController.h"
#import "ShiNeiViewController.h"
@interface ViewController ()

@property(nonatomic,strong)UIButton *shineiButton; /** 室内 */
@property(nonatomic,strong)UIButton *shiwaiButton; /** 室外 */

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    __weak typeof(self) weadSelf = self;
    [self.view addSubview:self.shineiButton];
    [_shineiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weadSelf.view.mas_left).mas_offset(20);
        make.top.mas_equalTo(weadSelf.view.mas_top).mas_equalTo(50);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.view layoutIfNeeded];
    
    [self.view addSubview:self.shiwaiButton];
    [_shiwaiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weadSelf.shineiButton.mas_right).mas_equalTo(100);
        make.top.mas_equalTo(weadSelf.view.mas_top).mas_equalTo(50);
        make.size.mas_equalTo(weadSelf.shineiButton.frame.size);
    }];
    [self.view layoutIfNeeded];
    
    [_shineiButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_shiwaiButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)clickButton :(UIButton*)button{
    if (button.tag == 1001) {
        ShiNeiViewController *shiwaiVC = [[ShiNeiViewController alloc]init];
        [self presentViewController:shiwaiVC animated:YES completion:nil];
    }else
       {
            TwoViewController *shiwaiVC1 = [[TwoViewController alloc]init];
        [shiwaiVC1.view setFrame:self.view.frame];

            [self presentViewController:shiwaiVC1 animated:YES completion:nil];
        }
    
}


-(UIButton *)shineiButton{
    if (!_shineiButton) {
        _shineiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shineiButton setTitle:@"室内" forState:UIControlStateNormal];
        _shineiButton.backgroundColor = [UIColor greenColor];
        _shineiButton.tag = 1001;
    }
    return _shineiButton;
}

-(UIButton *)shiwaiButton{
    if (!_shiwaiButton) {
        _shiwaiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shiwaiButton setTitle:@"室外" forState:UIControlStateNormal];
        _shiwaiButton.backgroundColor = [UIColor blueColor];
        _shiwaiButton.tag = 1002;
    }
    return _shiwaiButton;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
