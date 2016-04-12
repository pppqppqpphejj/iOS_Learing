//
//  BarViewController.m
//  BorderDemo
//
//  Created by 浩GG on 15/3/17.
//  Copyright (c) 2015年 YaoYu. All rights reserved.
//

#import "BarViewController.h"

@interface BarViewController ()

@end

@implementation BarViewController

@synthesize delegate;

-(id)initWithFrame:(CGRect)frame{

    self=[super init];
    if(self){
        _frame=frame;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=_frame;
    self.view.backgroundColor=[UIColor colorWithRed:150.0/255.0 green:150.0/255.0 blue:150.0/255.0 alpha:1.0];
    
    selectedTag = 0;
    bar_array_TextTitle=[title_bar_array_ImageNormal mutableCopy];
    bar_array_ImageNormal=[deselect_bar_array_ImageNormal mutableCopy];

    bar_array_ImageHeight=[select_bar_array_Height mutableCopy];

    itemBtb_Arr = [[NSMutableArray alloc] initWithObjects:itemOne,itemTwo,itemThree,itemFour,itemFive, nil];
    
    selectedTag = 0;
    for (int i=0; i<itemBtb_Arr.count; i++)
        {
        ItemButtion *button = [itemBtb_Arr objectAtIndex:i];
        
//        if (i==selectedTag) {
//            [button.lalTitle setTextColor:[UIColor colorWithRed:68.0/0xff green:192.0/0xff blue:250.0/0xff alpha:1]];
//            [button.imvMain setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[bar_array_ImageHeight objectAtIndex:i]]]];
//        }else
//            {
//            [button.imvMain setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[bar_array_ImageNormal objectAtIndex:i]]]];
//            [button.lalTitle setTextColor:[UIColor colorWithRed:153.0/0xff green:153.0/0xff blue:153.0/0xff alpha:1]];
//            }
        
        
        button.imHight  = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[bar_array_ImageHeight objectAtIndex:i]]];
        button.imNormal = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[bar_array_ImageNormal objectAtIndex:i]]];
        
        [button.lalTitle setText:[bar_array_TextTitle objectAtIndex:i]];
        if (i==0) {
            button.imvMain.image = button.imHight;
            button.selected = YES;
        }
        else{
            button.imvMain.image = button.imNormal;

            button.selected = NO;
        }
        button.tag = i;
        
        [button removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(selectedOneBut:) forControlEvents:UIControlEventTouchUpInside];

        }
//    for(NSInteger i=0;i<bar_array_TextTitle.count;i++){
//        UIButton *itemBut=[itemBtb_Arr objectAtIndex:i];
//        
//        if (i==0) {
//            itemBut.selected = YES;
//        }
//        else{
//            itemBut.selected = NO;
//        }
//        itemBut.tag=i;
//
//        itemBut.backgroundColor=[UIColor clearColor];
//        itemBut.frame=CGRectMake(i*self.view.frame.size.width/5, 0, self.view.frame.size.width/5,self.view.frame.size.height);
//        itemBut.contentMode = UIViewContentModeCenter;
//        NSString * indexString = [bar_array_TextTitle objectAtIndex:i];
//        [itemBut setTitle:indexString forState:UIControlStateNormal];
//        [itemBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [itemBut setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[bar_array_ImageNormal objectAtIndex:i]]] forState:UIControlStateNormal];
//        [itemBut setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[bar_array_ImageHeight objectAtIndex:i]]] forState:UIControlStateSelected];
//
//        itemBut.titleLabel.font=[UIFont systemFontOfSize:14.0];
//        itemBut.layer.borderColor=[UIColor blackColor].CGColor;
//        itemBut.layer.borderWidth=0.5;
//        [itemBut removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
//
//        [itemBut addTarget:self action:@selector(selectedOneBut:) forControlEvents:UIControlEventTouchUpInside];
//        [itemBtb_Arr addObject:itemBut];
//        [self.view addSubview:itemBut];
//    }
    [delegate btnBarTitleArry:itemBtb_Arr];

    backView=[[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width/5,self.view.frame.size.height)];
    backView.backgroundColor=[UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1.0];
    [self.view insertSubview:backView atIndex:0];
    
}



-(void)selectedOneBut:(UIButton *)sender
{
    
//    selectedTag = sender.tag;
    NSInteger index=sender.tag;
    [self animationToMoveWithIndex:index];
    [delegate selectedOneItemWithIndex:index];
    
    for (ItemButtion * button in itemBtb_Arr) {
        
        if (button.tag == sender.tag)
        {
            button.imvMain.image = button.imHight;

            button.selected = YES;
        }
        else{
            button.imvMain.image = button.imNormal;

            button.selected =NO;
        }
        [button setNeedsLayout];
        [button layoutIfNeeded];
        
    }
    
    
//    if (selectedTag==0) {
//        sender.selected = YES;
//    }
    

    
    
    
}


-(void)animationToMoveWithIndex:(NSInteger)index{

    [UIView animateWithDuration:0.25 animations:^{
        backView.frame=CGRectMake(index*backView.frame.size.width, 0,backView.frame.size.width,backView.frame.size.height);
    }];

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
