//
//  InMapView.h
//  testIndoorLibDemo
//
//  Created by auto on 15/11/17.
//  Copyright © 2015年 autonavi. All rights reserved.
//

#import "IndoorMapView.h"
#define kGT_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define kGT_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface InMapView : NSObject

+(instancetype)sharedMapView;

@property(nonatomic,strong)  IndoorMapView    *mapView;

@end
