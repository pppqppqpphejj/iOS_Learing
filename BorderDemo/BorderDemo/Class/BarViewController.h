//
//  BarViewController.h
//  BorderDemo
//
//  Created by 浩GG on 15/3/17.
//  Copyright (c) 2015年 YaoYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BarDelegate <NSObject>
/**表现所选功能**/
-(void)selectedOneItemWithIndex:(NSInteger)index;
/**功能按钮切换过去**/
-(void)btnBarTitleArry:(NSMutableArray *)btnArr;


@end

@interface BarViewController : UIViewController
{
    
    NSInteger selectedTag;
    CGRect _frame;
    /**barTitle Text设置**/
    NSMutableArray *bar_array_TextTitle;
    /**正常状态的背景图片**/
    NSMutableArray *bar_array_ImageNormal;
    /**选中时的背景图**/
    NSMutableArray *bar_array_ImageHeight;
    /**itemBtb_Arr**/
    NSMutableArray *itemBtb_Arr;


    UIView *backView;
    
}

@property(nonatomic,strong)id<BarDelegate> delegate;

-(id)initWithFrame:(CGRect)frame;
-(void)animationToMoveWithIndex:(NSInteger)index;

@end
