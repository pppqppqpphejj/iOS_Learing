//
//  TopNavView.m
//  ViewLearing
//
//  Created by 邵瑞 on 16/1/17.
//  Copyright © 2016年 wonders. All rights reserved.
//

#import "TopNavView.h"
#import "AppDelegate.h"
#import "ViewController.h"
@implementation TopNavView
-(instancetype)init
{
self = [super init];
    if (self) {
        

    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        NSLog(@"frame  %@",NSStringFromCGRect(frame));

    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self INITSELFUIAwakeFromNibCODE];

    }
    return  self;
}
-(void)setFrame:(CGRect)frame
{
    
    [super setFrame:frame];
    NSLog(@"frame  %@",NSStringFromCGRect(frame));

    NSLog(@"self.TopNav.frame %@",NSStringFromCGRect(self.TopNav.frame));

    [self.TopNav setFrame:frame];
    
    NSLog(@"self.TopNav.frame %@",NSStringFromCGRect(self.TopNav.frame));
    

}


-(void)INITSELFUIAwakeFromNibCODE
{
//    NSArray * arr = [[UIApplication sharedApplication] windows];


    ViewController * viewNav  =[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:viewNav];
    self.parentController = nav;
    self.parentController.navigationBarHidden = YES;
    self.parentController.navigationBar.hidden =YES;
    // Initialization code
    NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"TopNavView" owner:self options:nil];
    self.TopNav = [nibArr objectAtIndex:0];
//    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.TopNav.translatesAutoresizingMaskIntoConstraints = NO;
    self.lalTopTitel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_TopNav];
    
    NSDictionary * viewFrames = NSDictionaryOfVariableBindings(_TopNav);
    
    //V:  :表示垂直
    //H:  :表示水平

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_TopNav]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:viewFrames]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_TopNav]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:viewFrames]];
    
    
    
    
    
   
    

//    [self.TopNav addConstraint:[NSLayoutConstraint constraintWithItem:self.lalTopTitel attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.TopNav attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:10]];

    [self.btnTopGoback setBackgroundColor:[UIColor clearColor]];
    [self.btnTopGoback addTarget:self action:@selector(Goback:) forControlEvents:UIControlEventTouchUpInside];
 


    
}

#pragma mark - button event
-(void)Goback:(UIButton *)button
{
    
    
    if(self.noPop)
    {
        [self.ViewController dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    }
    else if(!self.noPop)
    {
        [self.ViewController.navigationController popViewControllerAnimated:YES];
        
    }
//    [self.parentController dismissViewControllerAnimated:YES completion:NULL];
//    AppDelegate * win = (AppDelegate *) [[UIApplication sharedApplication] keyWindow];
//    [win.window.rootViewController dismissViewControllerAnimated:YES completion:^{
//        
//    } ];

    
//    if ([self.parentController respondsToSelector:@selector(popViewControllerAnimated:)]) {
//        [self.parentController popToRootViewControllerAnimated:YES];
//    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation UIBackButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)awakeFromNib
{
    [self setBackgroundColor:[UIColor clearColor]];
    [self.imageView setImage:[UIImage imageNamed:@"返回按钮"]];
    [self setShowsTouchWhenHighlighted:YES];
}
-(void)viewPop:(UIView *)viewCont Animated:(BOOL)yes
{
    
}
-(void)layoutSubviews
{
    [self.imageView setFrame:CGRectMake(11.0f, 12.0f, 12.0, 22.0)];
}
@end
@implementation UITITTLeLab

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self awakeFromNib];
    }
    return self;
    
}
-(void)awakeFromNib
{
    [self setTextAlignment:NSTextAlignmentCenter];
}


@end