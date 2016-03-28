//
//  ImageControl.m
//  UIControlExample
//
//  Created by nice on 15/12/1.
//  Copyright © 2015年 iosdev. All rights reserved.
//

#import "ImageControl.h"

@implementation ImageControl {
    
    UILabel     *_label;
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);
        
        [self addSubview:({
            
            _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
            _imageView.image = image;
            _imageView;
        })];
        
        
        [self addSubview:({
            _label = [[UILabel alloc] initWithFrame:(CGRect){0.0f, height - 30.0f, width, 30.0f}];
            _label.textAlignment = NSTextAlignmentCenter;
            _label.textColor = [UIColor whiteColor];
            _label.text = title;
            _label;
        })];
    }
    
    return self;
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    // 由对象本身来处理事件
    [super sendAction:@selector(handleAction:) to:self forEvent:event];
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    CGRect bounds = self.bounds;
//    return CGRectContainsPoint(bounds, point);
//}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    
    NSLog(@"Begin %d", self.tracking);
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super continueTrackingWithTouch:touch withEvent:event];
    
    NSLog(@"Continue %d %@", self.tracking, (self.touchInside ? @"YES" : @"NO"));
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
    
    CGPoint position = [touch locationInView:self];
    
    if (CGRectContainsPoint(_label.frame, position)) {
        
        // 在此触发一个UIControlEventTouchUpInside事件行为
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    
    NSLog(@"End %d", self.tracking);
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [super cancelTrackingWithEvent:event];
    
    NSLog(@"Cancel");
}

- (void)handleAction:(id)sender {
    
    NSLog(@"handle Action");
    
    NSLog(@"target-actoin: %@", self.allTargets);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    
//    NSLog(@"Touch began");
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    [super touchesMoved:touches withEvent:event];
//    
//    NSLog(@"Touch Moved");
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesEnded:touches withEvent:event];
//    
//    NSLog(@"Touch End");
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    [super touchesCancelled:touches withEvent:event];
//    
//    NSLog(@"Touch Cancel");
//}

@end
