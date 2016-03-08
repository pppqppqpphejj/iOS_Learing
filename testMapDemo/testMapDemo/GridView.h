//
//  GridView.h
//
//  Created by Apple on 15/1/1.
//  Copyright (c) 2015年 AutoNavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  GridProtocol <NSObject>

- (void)gridClick:(NSUInteger)row
            colum:(NSUInteger)colum
             type:(NSString *)type;

@end

@interface GridView : UIView
@property (nonatomic,strong) UIImage * image;
@property (nonatomic,strong) NSString * text;
@property (nonatomic,strong) NSString * type;
@property(nonatomic,assign)id<GridProtocol> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                          row:(NSUInteger)row
                        colum:(NSUInteger)colum;

@end
