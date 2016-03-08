//
//  ViewController.m
//  testMapDemo
//
//  Created by 邵瑞 on 16/3/7.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"
#import "IndoorRouteRequest.h"
#import "IndoorSearchEngine.h"
#import "IndoorDataManger.h"
#import "IndoorFloorHBar.h"
#import "InMapView.h"

//#import ""
@interface ViewController ()<IndoorMapViewDelegate,IndoorDataMangerProtocol,UIActionSheetDelegate,UITextFieldDelegate,IndoorFloorHBarDelegate>
@property (strong,nonatomic)IndoorBuilding * indoorBuilding;
@property (strong,nonatomic)IndoorMarkerView * markerView;
//楼层切换视图
@property(nonatomic,strong)  IndoorFloorHBar  *floorBarView;
//地图视图
@property (strong, nonatomic)  IndoorMapView *mapView;

@property(nonatomic,strong)  PointD           *userLocation;
@property(nonatomic,strong)  IndoorRouteResponse *indoorRR;

@property(nonatomic,strong)  IndoorMarkerView *selMarkView;

//地图标注
@property(nonatomic,strong)  NSMutableDictionary *markViews;
//楼层数组
@property(nonatomic,strong)  NSMutableArray   *floorsAry;
//放大
@property(nonatomic,strong)  UIButton   *addBtn;
//缩小
@property(nonatomic,strong)  UIButton   *subBtn;
//重定位
@property(nonatomic,strong)  UIButton   *locBtn;
@property(nonatomic,assign)  BOOL             isRoute;

@property(nonatomic,assign)  int              selFloorIndex;

@end

@implementation ViewController
-(void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
    self.buildId= @"B000A856LJ";
    self.buildName = @"朝阳大悦城";

    self.title = self.buildName;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.floorsAry =[[NSMutableArray alloc]initWithCapacity:0];
    self.mapView.backgroundColor = [UIColor blueColor];
    self.mapView = [InMapView sharedMapView].mapView;

    self.mapView.delegate = self;

    self.mapView.isPlottingScale = YES;
    self.mapView.iscompassView   = YES;
    
    [self.view addSubview:self.mapView];

    [IndoorDataManger getInstance].delegate = self;
    [[IndoorDataManger getInstance] downloadMapData:@"e3878da81910c6b30acf7e970b7222de"
                                            buildid:self.buildId
                                       checkNewData:YES];
    
    
  
    self.markerView = nil;
    self.markViews = [[NSMutableDictionary alloc]initWithCapacity:0];
    
    self.userLocation = [[PointD alloc]init];
    self.userLocation.lon = @"116.518539";
    self.userLocation.lat = @"39.9242401";
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            self.mapView.delegate = self;
            self.mapView.isPlottingScale = YES;
            self.mapView.iscompassView = YES;
            [self.view insertSubview:self.mapView atIndex:0];
        
            CGPoint point;
            point.x =116.518539;
            point.y =39.9242401;
            [self.mapView updateUserLoc:point withFloorNum:1];
    
    
}

#pragma mark textfield
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark action
- (void)onTapLocation
{
    
    
}

- (void)onTapZoomIn
{
    [self.mapView zoomIn];
        // [self.mapView updateRotationZ:180];
}

- (void)onTapZoomOut
{
    [self.mapView zoomOut];
}

- (void)showPoiInfo:(IndoorMarkerView *)idoorMView
{
    
    if (idoorMView) {
        NSLog(@"showPoiInfo:%f",idoorMView.info.x);
        self.poiView.hidden = NO;
        self.nameLabel.text =idoorMView.info.name;
        for (IndoorFloorInfo *info in self.floorsAry) {
            if(info.floorIndex  == idoorMView.info.floorNum)
                {
                self.floorLabel.text =info.namecode;
                break;
                }
        }
            //_nameLabel.center = CGPointMake(self.view.frame.size.width/2, 5);
        idoorMView.contentMode = UIViewContentModeCenter;
        [idoorMView setFrame:CGRectMake(0, 0, 100, 100)];
        self.selMarkView =idoorMView;
    }
    
}

- (void)animationCtrl
{
    [UIView animateWithDuration:0.3 animations:^{
        self.addBtn.frame =CGRectMake(self.view.frame.size.width-60, self.view.frame.size.height- 190, 50, 50);
        self.subBtn.frame =CGRectMake(self.view.frame.size.width-60, self.view.frame.size.height- 140, 50, 50);
        self.locBtn.frame =CGRectMake(10, self.view.frame.size.height- 140, 50, 50);
    } completion:^(BOOL finish){
        
    }];
    
    
}

- (void)removeAnimationCtrl
{
    [UIView animateWithDuration:0.3 animations:^{
        self.addBtn.frame =CGRectMake(self.view.frame.size.width-60, self.view.frame.size.height- 180, 50, 50);
        self.subBtn.frame =CGRectMake(self.view.frame.size.width-60, self.view.frame.size.height- 130, 50, 50);
        self.locBtn.frame =CGRectMake(10, self.view.frame.size.height- 130, 50, 50);
    } completion:^(BOOL finish){
        
    }];
    
    
}

#pragma mark floor

#pragma mark - mapviewDelegate
- (void)didTapPoint:(CGPoint)point withFloorNum:(int)num withPoiArray:(NSArray *)array
{
    NSLog(@"第三次");
    
    
    NSLog(@"didTapPoint:%@",array);
    if (self.isRoute) {
        return ;
    }
    
    if([array count]<=0)
        {
        self.poiView.hidden = YES;
        return ;
        }
    
    IndoorPoiInfo *poi= (IndoorPoiInfo *)array[0];
    
    if (poi.type == 900 || poi.type == 100 || poi.type == 300) {
        return ;
    }
    if(self.markerView == nil){
        self.markerView= [self.mapView addMarker:CGPointMake(poi.x, poi.y) withFloorNum:num withPoiInfo:poi withImageName:@"default_map_select_point_normal"];
    }
    else{
        [self.mapView removeMarkers];
        self.markerView = nil;
            //self.poiView.hidden = YES;
        self.markerView= [self.mapView addMarker:CGPointMake(poi.x, poi.y) withFloorNum:num withPoiInfo:poi withImageName:@"default_map_select_point_normal"];
        
    }
    
    [self showPoiInfo:self.markerView];
    [self animationCtrl];
    [self.mapView setViewPortToLocationX:point.x withY:point.y];
}


- (void)didLongPressPoint:(CGPoint)point withFloorNum:(int)num withPoiArray:(NSArray *)array
{
    NSLog(@"第二次");
    
    NSLog(@"%@",array);
    
    if([array count]==0)
        return ;
        //IndoorPoiInfo *poi= (IndoorPoiInfo *)array[0];
    
    NSLog(@"%@",self.markerView);
    
}

- (void)didScaleChanged:(float)scale withScaleState:(kFEGLScaleState)state
{
    
    
}

#pragma mark poi click
- (void)didTapClick:(IndoorMarkerView *)idoorMView
{
    
    if (idoorMView) {
        NSLog(@"第一次");
        NSLog(@"idoorMView.info.name  %@" , idoorMView.info.name);
        
        
        UIView * imageViw = [[UIView alloc] init];
            //        imageViw.frame = CGRectMake(0, 0, <#CGFloat width#>, <#CGFloat height#>)
        idoorMView.backgroundColor = [UIColor redColor];
        NSLog(@"%@",NSStringFromCGRect(idoorMView.frame));
        
            //        [self.markView addSubview:imageViw];
            //        [self.mapView removeMarker:idoorMView];
            //
            //        [self.mapView removeMarkers];
            //        self.markView = nil;
            //        self.poiView.hidden = YES;
        [self removeAnimationCtrl];
    }
    
}
-(void)popMarkeView
{
    
    
}

- (void)onTapBack
{
    [self.mapView removePathsData:self.indoorRR];
//    [self.showWayView removeFromSuperview];
//    [self.routeView removeFromSuperview];
    self.poiView.hidden = NO;
    self.isRoute = NO;
}

- (void)onTapShowWay
{
    [self.mapView loadFloorWithIndex:self.startFool];
}

- (void)onTapGo
{
//    SelectPoiViewController *spc = [[SelectPoiViewController alloc]init];
//    spc.selMarkView = self.selMarkView;
//    spc.userLocation = self.userLocation;
//    spc.spoid = self.buildId;
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
//    self.navigationItem.backBarButtonItem = barButtonItem;
//    [self.navigationController pushViewController:spc animated:YES];
}


#pragma mark download
- (void)downloadMapDataSuccess:(IndoorBuilding *)indoorBuilding
{
    NSLog(@"downloadMapDataSuccess:%@",indoorBuilding.buildid);
        //

    [self.mapView LoadDataFile:indoorBuilding.path];
    
    self.indoorBuilding = indoorBuilding;
    
    NSArray *ary = [self.mapView getFloorInfos];
    
    [self.floorsAry addObjectsFromArray:ary];
    
    _floorBarView = [[IndoorFloorHBar alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height- 220, 50, 80 )];
    _floorBarView.delegate = self;
    [_floorBarView setData:ary startIndex:(int)1];
        // [self.view insertSubview:_floorBarView aboveSubview:self.view];
    [self.view addSubview:_floorBarView];
    
    IndoorFloorInfo *info = (IndoorFloorInfo *)ary[1];
    
    [self.mapView loadFloorWithIndex:[NSString stringWithFormat:@"%d",info.floorIndex ]];
    
    self.selFloorIndex = info.floorIndex;
    
    [self.mapView updateScale:(0.1f)];
    CGPoint point;
    point.x =116.518539;
        //    116.518539,39.9242401
        //    106.496422,29.62026
    point.y =39.9242401;
    [self.mapView updateUserLoc:point withFloorNum:info.floorIndex];
}

/*!
 *  下载地图数据失败
 *
 */
- (void)downloadMapDataFailed:(NSString *)poiid
error:(NSError *)error
{
    NSLog(@"downloadMapDataFailed:%@",error);
    UIAlertView *aView = [[UIAlertView alloc]initWithTitle:@"地图请求" message:[error domain] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [aView show];
}


#pragma mark floor click
-(void)setFloorIndex:(int)floorIndex
{
    NSLog(@"%d",floorIndex);
    self.selFloorIndex = floorIndex;
    [self.mapView loadFloorWithIndex:[NSString stringWithFormat:@"%d",floorIndex]];
    [self.mapView updateScale:(0.1f)];
    if (floorIndex == 1) {
        CGPoint point;
        point.x =116.518539;
        point.y =39.9242401;
        [self.mapView updateUserLoc:point withFloorNum:1];
    }
    
}

#pragma mark action
- (void)loadSearchPoi:(IndoorEn *)en
{
    [self.mapView removeMarkers];
    [self.mapView loadFloorWithIndex:[NSString stringWithFormat:@"%d",en.floorIndex ]];
    
    IndoorPoiInfo *poi = [[IndoorPoiInfo alloc]init];
    poi.name = en.name_dp;
    poi.x = en.centerX;
    poi.y = en.CenterY;
    poi.type = en.typeCode;
    poi.floorNum = en.floorIndex;
    
    IndoorMarkerView * imv = [self.mapView addMarker:CGPointMake(poi.x, poi.y) withFloorNum:en.floorIndex withPoiInfo:poi withImageName:@"default_map_select_point_normal"];
    
    [self.mapView setViewPortToLocationX:poi.x withY:poi.y];
    
        //[self.floorView selviewByIndex:en.floorIndex];
    [self.floorBarView gotoPageByIndex:poi.floorNum];
    
    [self showPoiInfo:imv];
}

- (void)loadSearchAllPoi:(NSArray *)pois
{
    [self.mapView removeMarkers];
    BOOL isHave = false;
    for (IndoorEn *en in pois) {
        IndoorPoiInfo *poi = [[IndoorPoiInfo alloc]init];
        poi.name = en.name_dp;
        poi.x = en.centerX;
        poi.y = en.CenterY;
        poi.type = en.typeCode;
        poi.floorNum = en.floorIndex;
        
        [self.mapView addMarker:CGPointMake(poi.x, poi.y) withFloorNum:en.floorIndex withPoiInfo:poi withImageName:@"default_map_select_point_normal"];
        
        if (self.selFloorIndex == poi.floorNum) {
            isHave = YES;
        }
    }
    
    if (isHave) {
        [self.mapView loadFloorWithIndex:[NSString stringWithFormat:@"%d",self.selFloorIndex ]];
        [self.floorBarView gotoPageByIndex:self.selFloorIndex];
    }else{
        IndoorEn *en = (IndoorEn *)pois[0];
        [self.mapView loadFloorWithIndex:[NSString stringWithFormat:@"%d",en.floorIndex ]];
        
        [self.floorBarView gotoPageByIndex:en.floorIndex];
    }
    
    
    
    self.poiView.hidden = YES;
}



@end
