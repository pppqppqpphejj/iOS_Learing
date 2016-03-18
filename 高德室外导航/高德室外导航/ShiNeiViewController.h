//
//  ShiNeiViewController.h
//  高德室外导航
//
//  Created by 邵瑞 on 16/3/14.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapNaviKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>


@interface ShiNeiViewController : UIViewController<AMapNaviViewControllerDelegate,AMapNaviManagerDelegate,AMapNaviHUDViewControllerDelegate,MAMapViewDelegate,AMapLocationManagerDelegate>
@property(strong,nonatomic) MAMapView *mapView;
@property (strong,nonatomic) AMapLocationManager * locationManager;
@end
