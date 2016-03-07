//
//  testViewController.m
//  testLiHuaKeGu
//
//  Created by 邵瑞 on 16/3/4.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "testViewController.h"

#import "XIBVC.h"
@interface testViewController ()
/**凡返回上一级**/
- (IBAction)popAction:(id)sender;
@property (strong,nonatomic) IBOutlet XIBVC * xibView;
@property (strong,nonatomic) XIBVC * xibView3;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    self.xibView3 = [[[XIBVC alloc] init] initWithFrame:CGRectMake(0, 100, 100, 100)];
    
    [self.view addSubview:self.xibView3];
    
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)popAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
