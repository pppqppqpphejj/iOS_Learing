//
//  ViewController.m
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/17.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "ViewController.h"
#import "viewClass.h"
#import "TopNavView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet viewClass *viewCl;
@property (weak, nonatomic) IBOutlet TopNavView *TopNav;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.TopNav.parentController = self.navigationController;
    [self.navigationController setNavigationBarHidden:YES];
    [self.TopNav.lalTopTitel setText:@"返回111"];
    [self.TopNav.btnTopGoback setTitle:@"返回" forState:UIControlStateNormal];
    [self.TopNav.btnTopGoback setHidden: YES];
    
    [self.TopNav.btnTopGoback removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
    [self.TopNav.btnTopGoback addTarget:self action:@selector(btnTopGoback:) forControlEvents:UIControlEventTouchUpInside];
    

//    [self.view addSubview:self.viewCl];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnTopGoback:(id)sender
{
    NSLog(@"self.TopNav.btnTopGoback.frame %@",NSStringFromCGRect(self.TopNav.btnTopGoback.frame));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
