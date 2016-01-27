//
//  ViewController.m
//  CodeAutoSizeClass
//
//  Created by 邵瑞 on 16/1/15.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "ViewController.h"
#import "LoadingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
        /*
         |: 表示父视图
         -:表示距离
         V:  :表示垂直
         H:  :表示水平
         >= :表示视图间距、宽度和高度必须大于或等于某个值
         <= :表示视图间距、宽度和高度必须小宇或等于某个值
         == :表示视图间距、宽度或者高度必须等于某个值
         @  :>=、<=、==  限制   最大为  1000
         
         1.|-[view]-|:  视图处在父视图的左右边缘内
         2.|-[view]  :   视图处在父视图的左边缘
         3.|[view]   :   视图和父视图左边对齐
         4.-[view]-  :  设置视图的宽度高度
         5.|-30.0-[view]-30.0-|:  表示离父视图 左右间距  30
         6.[view(200.0)] : 表示视图宽度为 200.0
         7.|-[view(view1)]-[view1]-| :表示视图宽度一样，并且在父视图左右边缘内
         8. V:|-[view(50.0)] : 视图高度为  50
         9: V:|-(==padding)-[imageView]->=0-[button]-(==padding)-| : 表示离父视图的距离
         为Padding,这两个视图间距必须大于或等于0并且距离底部父视图为 padding。
         10:  [wideView(>=60@700)]  :视图的宽度为至少为60 不能超过  700
         11: 如果没有声明方向默认为  水平  V:
         */
    UIView * viewOne = [self viewSubOne];
    
    UIView * viewTwo = [self viewSubTwo];

    [self.view addSubview:viewOne];
    [self.view addSubview:viewTwo];
    //添加viewOne、viewTwo允许自动布局的子视图
    
         //如下⬇️设置子视图的宽度和父视图的宽度相同
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:viewOne
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
   
    
    
        //设置字视图的高度为45 ，倍m数为0
        //倍数为1则高度为父视图高度
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:viewOne
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0
                                                           constant:45]];
    

    
    //设置子视图的底部距离父视图底部45个像素

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                           toItem:viewOne

                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:45]];
    
    

    
//    NSDictionary *  dicViewOne = NSDictionaryOfVariableBindings(viewOne);//绑定约束视图
//    NSArray * viewOneCon = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[viewOne]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:dicViewOne];
//    [self.view addConstraints:viewOneCon];
    
//    NSLayoutConstraint * viewTwoCon = [NSLayoutConstraint constraintsWithVisualFormat:nil options:nil metrics:nil views:nil];
//    [self.view addConstraints:viewTwoCon];


    
    
    
        // Do any additional setup after loading the view, typically from a nib.
}

-(UIView *)viewSubOne
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor redColor];

    return  view;
}

-(UIView *)viewSubTwo
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor grayColor];
    
    return  view;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
