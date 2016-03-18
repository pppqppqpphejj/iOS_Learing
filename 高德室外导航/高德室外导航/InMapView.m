//
//  InMapView.m
//  testIndoorLibDemo
//
//  Created by auto on 15/11/17.
//  Copyright © 2015年 autonavi. All rights reserved.
//

#import "InMapView.h"

#define kGT_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define kGT_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@implementation InMapView

+(instancetype)sharedMapView
{
    static dispatch_once_t oneToken;
    static InMapView *instance = nil;
    dispatch_once(&oneToken, ^{
        instance = [[InMapView alloc]init];
    });
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.mapView = [[IndoorMapView alloc] initWithFrame:CGRectMake(0, 0, kGT_SCREEN_WIDTH, kGT_SCREEN_HEIGHT)];
    }
    return self;
}

@end
