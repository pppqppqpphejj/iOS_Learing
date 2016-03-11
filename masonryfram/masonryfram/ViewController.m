//
//  ViewController.m
//  masonryfram
//
//  Created by 邵瑞 on 16/3/11.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
@property(nonatomic,strong)UIView *view0;
@property(nonatomic,strong)UIView *view1;
@property(nonatomic,strong)UIView *view2;
@property(nonatomic,strong)UIView *view3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.view0];

    [self.view0 .superview layoutIfNeeded];
    [self.view0 addSubview:self.view1];
    [self.view0 addSubview:self.view2];
    [self.view0 addSubview:self.view3];
    
    __weak typeof(self) weakself = self;
    [self.view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.view).insets(UIEdgeInsetsMake(40, 40, 40, 40));
    }];
    
    
}
-(UIView *)view0{
    if (!_view0) {
//        _view0 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen  mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _view0 = [[UIView alloc]init];
        _view0.backgroundColor = [UIColor greenColor];
    }
    return _view0;
}
-(UIView *)view1{
    if (!_view3) {
        _view3 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
        _view3.backgroundColor = [UIColor redColor];
    }
    return _view3;
}
-(UIView *)view2{
    if (!_view2) {
        _view2 = [[UIView alloc]initWithFrame:CGRectMake(10, 120, 100, 100)];
        _view2.backgroundColor = [UIColor blueColor];
    }
    return _view2;
}
-(UIView *)view3{
    if (!_view3) {
        _view3 = [[UIView alloc]initWithFrame:CGRectMake(10, 240, 100, 100)];
        _view3.backgroundColor = [UIColor orangeColor];
    }
    return _view3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
