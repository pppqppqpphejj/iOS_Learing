//
//  InMapView.h
//  testIndoorLibDemo
//
//  Created by auto on 15/11/17.
//  Copyright © 2015年 autonavi. All rights reserved.
//

#import "IndoorMapView.h"

@interface InMapView : NSObject

+(instancetype)sharedMapView;

@property(nonatomic,strong)  IndoorMapView    *mapView;

@end
