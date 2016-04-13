;//
//  MainViewController.m
//  BorderDemo
//
//  Created by 浩GG on 15/3/17.
//  Copyright (c) 2015年 YaoYu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

    one_con=[[OneViewController alloc] init];
    one_con.view.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-bottom_BarHight);
    [self addChildViewController:one_con];
    
    two_con=[[TwoViewController alloc] init];
    two_con.view.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-bottom_BarHight);
    [self addChildViewController:two_con];
    
    three_con=[[ThreeViewController alloc] init];
    three_con.view.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-bottom_BarHight);
    [self addChildViewController:three_con];
    
    four_con=[[FourViewController alloc] init];
    four_con.view.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-bottom_BarHight);
    [self addChildViewController:four_con];
    
    five_con=[[FiveViewController alloc] init];
    five_con.view.frame=CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-bottom_BarHight);
    [self addChildViewController:five_con];
    
    //当前显示页
    current_con=one_con;
    currentTag=0;
    [self.view addSubview:one_con.view];
    
    
    bar_view=[[BarViewController alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-bottom_BarHight, self.view.frame.size.width,bottom_BarHight)];
    bar_view.delegate=self;
    [self.view addSubview:bar_view.view];
    
    //手势切换控制器
    ;
    
    //向右划
    UISwipeGestureRecognizer *rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight)];
    [rightRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:rightRecognizer];
    //向左划
    UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft)];
    [leftRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [ self.view  addGestureRecognizer:leftRecognizer];
    
}


-(void)handleSwipeRight{
  
    NSInteger changeTag;
    if(currentTag==0){
        changeTag=4;
    }else{
        changeTag=currentTag-1;
    }
     [self selectedOneItemWithIndex:changeTag];
    [bar_view animationToMoveWithIndex:changeTag];
    
}

-(void)handleSwipeLeft{
    
    
    
    NSInteger changeTag;
    if(currentTag==4){
        changeTag=0;
    }else{
        changeTag=currentTag+1;
    }
    
    
    [self selectedOneItemWithIndex:changeTag];
    [bar_view animationToMoveWithIndex:changeTag];
}
 -(void)btnBarTitleArry:(NSMutableArray *)btnArr
{

    itemArray = btnArr;
    
}

-(void)selectedOneItemWithIndex:(NSInteger)tag{

    if(tag!=currentTag){
        
        if(tag==0){
            [self transitionFromViewController:current_con toViewController:one_con duration:0 options:UIViewAnimationOptionTransitionNone animations:^(){} completion:^(BOOL finished){
                current_con=one_con;
            }];
        }else if (tag==1){
            [self transitionFromViewController:current_con toViewController:two_con duration:0 options:UIViewAnimationOptionTransitionNone animations:^(){} completion:^(BOOL finished){
                current_con=two_con;
            }];
        }else if (tag==2){
            [self transitionFromViewController:current_con toViewController:three_con duration:0 options:UIViewAnimationOptionTransitionNone animations:^(){} completion:^(BOOL finished){
                current_con=three_con;
            }];
        }else if (tag==3){
            [self transitionFromViewController:current_con toViewController:four_con duration:0 options:UIViewAnimationOptionTransitionNone animations:^(){} completion:^(BOOL finished){
                current_con=four_con;
            }];
        }else if (tag==4){
            [self transitionFromViewController:current_con toViewController:five_con duration:0 options:UIViewAnimationOptionTransitionNone animations:^(){} completion:^(BOOL finished){
                current_con=five_con;
            }];
        }
        currentTag=tag;
        for (ItemButtion * btn in itemArray) {
            
            if (btn.tag == currentTag) {
                btn.selected = YES;
                btn.imvMain.image = btn.imHight;

                
            }
            else
                {
                btn.selected = NO;
                btn.imvMain.image = btn.imNormal;

                }
            [btn setNeedsLayout];
            [btn layoutIfNeeded];

            
        }

    }
    
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
