//
//  ShiNeiViewController.m
//  高德室外导航
//
//  Created by 邵瑞 on 16/3/14.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ShiNeiViewController.h"
#define APIKEY @"381713d7d6ec1a4c5d7e042438228bd5"


@interface ShiNeiViewController ()

@end

@implementation ShiNeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MAMapServices sharedServices].apiKey = APIKEY;
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:self.mapView];
    _mapView.showsCompass = YES;  // 罗盘
    _mapView.compassOrigin = CGPointMake(_mapView.compassOrigin.x, 64);
    
    _mapView.showsScale = YES;// 比例尺
    _mapView.scaleOrigin = CGPointMake(_mapView.scaleOrigin.x, CGRectGetHeight(self.view.bounds) - _mapView.scaleOrigin.y - 20);//设置比例尺的中心位置
    self.mapView.delegate = self;
        // 倾斜
    _mapView.rotateCameraEnabled= YES;
        // 用户位置
    self.mapView.showsUserLocation = YES;
        // 跟随显示
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    self.mapView.mapType = 0;
    
    /***   实现定位   ***/
    if (![CLLocationManager locationServicesEnabled]) {
//        [self alertWithTitle:@"地图定位关闭" message:@"可在设置->隐私->定位服务中打开" actionTitle:@"好"];
        NSLog(@"ksssss");
        return;
    }
        // 定位 （key）
    [AMapLocationServices sharedServices].apiKey = APIKEY;
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 5;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
