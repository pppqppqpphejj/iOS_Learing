//
//  GridView.m
//
//  Created by Apple on 15/1/1.
//  Copyright (c) 2015年 AutoNavi. All rights reserved.
//

#import "GridView.h"

@interface GridView ()
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UILabel * textLabel;

@property (nonatomic,assign) NSUInteger row;
@property (nonatomic,assign) NSUInteger colum;
@end

@implementation GridView

- (instancetype)initWithFrame:(CGRect)frame
                          row:(NSUInteger)row
                          colum:(NSUInteger)colum

{
    self = [super initWithFrame:frame];
    if (self) {
       self.imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width-20, self.frame.size.height- 20)];
        
        self.imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.imageView addGestureRecognizer:singleTap];
        
        [self addSubview:_imageView];
        self.textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(10, _imageView.frame.size.height + 20, self.frame.size.width -10, 20)];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_textLabel];
        self.imageView.tag = row*1+colum;
        self.row = row;
        self.colum = colum;
    }
    return self;
}

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    
    //do some method.....
//    UIImageView *iv = (UIImageView *) [gestureRecognizer view];
    if (self.delegate && ([self.delegate respondsToSelector:@selector(gridClick:colum:type:)])) {
        [self.delegate gridClick:self.row colum:self.colum type:self.type];
    }
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = _image;
}

- (void)setText:(NSString *)text
{
    _text = text;
    _textLabel.text = _text;
}
@end
