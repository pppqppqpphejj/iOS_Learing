//
//  ViewController.m
//  testMapDemoOne
//
//  Created by 邵瑞 on 16/3/8.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
 
    NSString * s;
}
/***
 * 描述说明 作为容器的主视图 占满整个视图的大小
 * 参数说明 NULL
 * 返回值说明，无用NULL表示
 ***/
@property(strong,nonatomic) UIView  *mainView;

@property (strong,nonatomic)UIScrollView *mainScrollView;
-(void)print;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    NSString * nilStr = @"";
    self.mainView = [[UIView alloc] initWithFrame:MAIN_SCREEN_FRAME];
    self.mainView.backgroundColor = [UIColor blueColor];
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
