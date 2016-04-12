//
//  UITopBanner.m
//  GroupDeal
//
//  Created by lewang on 14-5-10.
//  Copyright (c) 2014年 groupdeal. All rights reserved.
//

#import "UITopBanner.h"

@implementation UITopBanner


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self awakeFromNib];
    }
    return self;
}



-(void)awakeFromNib
{
    self.parentController = nil;
    
    // Initialization code
//    [[NSBundle mainBundle] loadNibNamed:@"UITopBanner" owner:self options:nil];
//    [self addSubview:_view];
    // Initialization code
    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"UITopBanner" owner:self options:nil];
    _view = [nibArray objectAtIndex:0];
    _view.translatesAutoresizingMaskIntoConstraints = NO;
//    self.translatesAutoresizingMaskIntoConstraints = NO;
//    self.btnGoback.translatesAutoresizingMaskIntoConstraints = NO;
//    self.lalTitel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_view);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_view]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_view]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    
    
    
    [self.btnGoback setBackgroundColor:[UIColor clearColor]];
    [self.btnGoback addTarget:self action:@selector(Goback:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self.view setFrame:frame];
}

#pragma mark - button event
-(void)Goback:(UIButton *)button
{
    [self.parentController popViewControllerAnimated:YES];
    [self.parentController dismissViewControllerAnimated:YES completion:NULL];
}

//-(void)AfterInit
//{
//    UIBackButton *button = [[UIBackButton alloc] initWithFrame:CGRectMake(0, 0, 56.0, 44.0)];
//    [view addSubview:button];
//}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
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
    [self.imageView setImage:[UIImage imageNamed:@"白色返回箭头"]];
    [self setShowsTouchWhenHighlighted:YES];
}

-(void)layoutSubviews
{
    [self.imageView setFrame:CGRectMake(11.0f, 12.0f, 12.0, 22.0)];
}
@end