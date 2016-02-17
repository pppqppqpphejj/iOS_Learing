//
//  ViewController.m
//  圆形头像Demo
//
//  Created by 邵瑞 on 16/1/28.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "ViewController.h"
#import "DFHeadImageView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet DFHeadImageView *imageView;
- (IBAction)changeYuan:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [_imageView setImage:[UIImage imageNamed:@"QQ20160128-0"]];
    [_imageView canReceiveAction:YES];
    self.imageView.layer.masksToBounds =YES;
//    [self changeYuan:nil];
//    [_imageView makeToCircle:!_imageView.makeToCircle];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeYuan:(id)sender {
    
    [_imageView makeToCircle:!_imageView.makeToCircle];
}
@end
