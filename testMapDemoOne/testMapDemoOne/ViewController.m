//
//  ViewController.m
//  testMapDemoOne
//
//  Created by 邵瑞 on 16/3/8.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"
#import "IndoorMapView.h"
#import "IndoorFloorHBar.h"
#import "IndoorDataManger.h"
#import "IndoorRouteRequest.h"
#include "IndoorSearchEngine.h"
#import "SerchViewController.h"
#import "InMapView.h"
#import <QuartzCore/QuartzCore.h>
@class IndoorEn;

@class PointD;
@interface ViewController ()<IndoorMapViewDelegate,IndoorDataMangerProtocol,UIActionSheetDelegate,UITextFieldDelegate,IndoorFloorHBarDelegate>
{
 
    NSString * s;
    /***隐藏显示***/
 BOOL             isHidden;
    

}


@property (strong,nonatomic)UIScrollView *mainScrollView;
/***
 * 描述说明: name 建筑物名称
 * 参数说明: 如:无用NULL
 * 返回值说明:，如:无用NULL表示
 ***/
@property(nonatomic,strong)  NSString *name;
/***
 * 描述说明: spoiid 建筑物ID
 * 参数说明: 如:无用NULL
 * 返回值说明:，如:无用NULL表示
 ***/
@property(nonatomic,strong)  NSString *spoiid;
/***
 * 描述说明:起点楼层
 * 参数说明: 如:无用NULL
 * 返回值说明:，如:无用NULL表示
 ***/
@property(nonatomic,strong)  NSString *startFloor;
/***
 * 描述说明:
 * 参数说明: 请求初始化数据
 * 返回值说明:，如:无用NULL表示
 ***/
@property (nonatomic,strong) NSArray * arrData;
/***
 * 描述说明:
 * 参数说明: 传入一个IndoorEn 实咧对象,搜索指定商户
 * 返回值说明:，如:无用NULL表示
 ***/
- (void)loadSearchPoi:(IndoorEn *)en;
/***
 * 描述说明
 * 参数说明: pois商户数组，标注数组,群定向搜索
 * 返回值说明，如:无用NULL表示
 ***/
- (void)loadSearchArrPoi:(NSArray *)pois;
/***
 * 描述说明
 * 参数说明pois商户数组，标注数组
 * 返回值说明，如:无用NULL表示
 ***/
- (void)loadSearchAllPoi:(NSArray *)pois;

/***声明室内地图View***/
@property(nonatomic,strong)  IndoorMapView    *mapView;
/***声明添加标注View***/
@property(nonatomic,strong)  IndoorMarkerView *markView;
/***声明添加标注数量***/
@property(nonatomic,strong)  NSMutableDictionary *markViews;

@property(nonatomic,strong)  NSMutableArray   *floorsAry;

/***缩放视图放大缩小***/
@property (nonatomic,strong) UIView *viewAddSub;
    //放大
@property(nonatomic,strong)  UIButton         *addBtn;
    //缩小
@property(nonatomic,strong)  UIButton         *subBtn;
    //重定位
@property(nonatomic,strong)  UIButton         *locBtn;

@property(nonatomic,strong)  UIView           *poiView;
@property(nonatomic,strong)  UILabel          *nameLabel;
@property(nonatomic,strong)  UILabel          *floorLabel;
@property(nonatomic,strong)  UIButton         *goBtn;

@property(nonatomic,strong)  IndoorBuilding   *indoorBuilding;
/***楼层地图切换***/
@property(strong,nonatomic)  IndoorFloorHBar  *floorBarView;

@property(nonatomic,strong)  PointD           *userLocation;

@property(nonatomic,strong)  IndoorMarkerView *selMarkView;
/***向上弹出view 动画***/
@property(nonatomic,strong)  UIView           *popUpView;

@property(nonatomic,strong)  UIButton         *backBtn;

@property(nonatomic,strong)  UIView           *showWayView;
@property(nonatomic,strong)  UILabel          *showWayLabel;
@property(nonatomic,strong)  UIButton         *showWayBtn;

@property(nonatomic,strong)  IndoorRouteResponse *indoorRR;

@property(nonatomic,assign)  BOOL             isRoute;
@property(nonatomic,assign)  int              selFloorIndex;
/***搜索查找商户***/
@property(strong,nonatomic)     UITapGestureRecognizer *tapSingle;

/***存放float 文本高度***/
@property (nonatomic)CGFloat textHight;

/***声明顶部搜索View***/
@property (strong,nonatomic)UIView  *topSearch;
/******/
@property (strong,nonatomic)UITextField *topTextFiel;
/***顶部lable***/
@property (strong,nonatomic)UILabel * toplLable;
/****室内地图数据初始化**/
-(void)InitMapData;
-(void)Animation:(CABasicAnimation *)base;
/***
 * 描述说明:计算文本高度
 * 参数说明: text 传入的文本字符串 font 传入的控件font CGFloat传入的控件宽度*
 * 返回值说明:返回 CGFloat hight 值
 ***/
- (CGFloat)initContentHightFloat:(CGFloat)fontl andText:(NSString*)text andWidth:(CGFloat)with;



@end

@implementation ViewController
@synthesize popUpView = _popUpView;
-(void)viewWillAppear:(BOOL)animated
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

- (void)viewDidLoad {
    [super viewDidLoad];


       // Do any additional setup after loading the view, typically from a nib.
    kWeakObject(self);



    self.mapView = [[IndoorMapView alloc] initWithFrame:MAIN_SCREEN_FRAME];
    self.mapView.backgroundColor = [UIColor clearColor];

    self.mapView.delegate = self;
    self.mapView.isPlottingScale = YES;
    self.mapView.iscompassView = YES;
    [self.view addSubview:self.mapView];
    _topSearch = [[UIView alloc] init];
    _topSearch.backgroundColor = [UIColor redColor];
    self.topSearch.userInteractionEnabled = YES;
    self.tapSingle =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToSearch:)];
    [self.topSearch addGestureRecognizer:self.tapSingle];
    [self.mapView addSubview:self.topSearch];
    UIEdgeInsets edge  = UIEdgeInsetsMake(0, 0, 0,0);
    self.topTextFiel  =[[UITextField alloc] init];
    self.topTextFiel.backgroundColor  = [UIColor lightTextColor];
    self.topTextFiel.textAlignment = NSTextAlignmentCenter;
    self.topTextFiel.placeholder =  @"点击进入搜索";
    self.topTextFiel.enabled =NO;
    self.topTextFiel.text =  @"";
    [self.topSearch addSubview:self.topTextFiel];

    
    self.toplLable = [[UILabel alloc] init];
    _toplLable.backgroundColor = [UIColor lightGrayColor];
    _toplLable.numberOfLines = 0;

    NSString *str = @"ddddd;;sskkkkk是生生世世生生世世说ss2016-03-10 15:22:40.693 testMapDemoOne[3039:107808] App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.";
//    NSAttributedString *att = [[NSAttributedString alloc]initWithString:str];
//    _toplLable.attributedText = att;//
    _toplLable.text = str;
    _toplLable.font = [UIFont systemFontOfSize:18];
    self.textHight = [self initContentHightFloat:18.00f andText:_toplLable.text andWidth:MAIN_SCREEN_FRAME.size.width-40];

    _toplLable.lineBreakMode = NSLineBreakByWordWrapping;
    [_toplLable sizeToFit];
    [self.mapView addSubview:self.toplLable];
    
    /*给 self.mainView 加约束*/
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];

    [self.topSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.mapView.mas_top).equalTo(@15);
        make.left.mas_equalTo(@20);
        make.right.mas_equalTo(@(-20));
        make.height.mas_equalTo(@30);
//        make.edges.mas_equalTo(self.mapView).insets(UIEdgeInsetsMake(10, 20, 0, 20));
    }];
     /*更新动画*/
    [self.topSearch.superview layoutIfNeeded];

    [self.topTextFiel mas_makeConstraints:^(MASConstraintMaker *make) {
        /*注释：简单距父视图的边距写法*/
        make.edges.mas_equalTo(self.topSearch).insets(edge);
    }];
    

   
 
    
    [self.toplLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(self.textHight);
        make.top.mas_equalTo(self.topSearch.mas_bottom).equalTo(@40);
    }];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, MAIN_SCREEN_HEIGHT-100, 30, 30);
    [button setTitle:@"sss" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(aaa:) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:button];
    
    self.markView = nil;
    self.markViews = [[NSMutableDictionary alloc]initWithCapacity:0];
    
    self.userLocation = [[PointD alloc]init];
    self.userLocation.lon = @"116.518539";
    self.userLocation.lat = @"39.9242401";

    [self InitMapData];
    [self.mapView setViewPortToLocationX:self.userLocation.lat.intValue withY:self.userLocation.lon.intValue];


}


-(void)aaa :(UIButton*)button{
//    [self.topSearch animationDidStart:];
//    
//     [UIView beginAnimations:nil context:nil];
////    setAnimationCurve来定义动画加速或减速方式
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationDuration:2.7];
//        //动画时长 5
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
//        // operation>>> 7
//    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
//        // end<<<<<</SPAN> 9
//    [UIView commitAnimations];
//    CGContextRef context = UIGraphicsGetCurrentContext();
//        //返回当前视图堆栈顶部的图形上下文 12
//    [UIView beginAnimations:nil context:context];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//     [UIView setAnimationDuration:1.0];
//        // View changes go here
//     [self.topSearch setAlpha:0.0f];
//    [UIView commitAnimations];
    
    [UIView animateWithDuration:2 animations:^{
        
        [_topSearch mas_updateConstraints:^(MASConstraintMaker *make) {


            make.top.mas_equalTo(self.mapView.mas_top).equalTo(@150);
            make.left.mas_equalTo(@20);
            make.right.mas_equalTo(@(-20));
            make.height.mas_equalTo(@40);
        }];
        
        [self.topSearch.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2 animations:^{
            [_topSearch mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.top.mas_equalTo(self.mapView.mas_top).equalTo(@15);
                make.left.mas_equalTo(@20);
                make.right.mas_equalTo(@(-20));
                make.height.mas_equalTo(@40);
            }];
            
            [self.topSearch.superview layoutIfNeeded];
        }];



    }];
}

-(void)Animation:(CABasicAnimation *)base
{
    
    
    
}


-(void)InitMapData
{
    NSString * spoiid = @"B000A856LJ";
        //    NSString * name = @"朝阳大悦城";
    [IndoorDataManger getInstance].delegate = self;
    [[IndoorDataManger getInstance] downloadMapData:@"9f00f31b04e6296ac3afe84cb1da0dde" buildid:spoiid checkNewData:YES];
}

#pragma mark - IndoorDataMangerProtocol
-(void)downloadMapDataSuccess:(IndoorBuilding *)indoorBuilding
{
    
    kWeakObject(self);
    
    NSLog(@"downloadMapDataSuccess:%@",indoorBuilding.buildid);
        //
    [self.mapView LoadDataFile:indoorBuilding.path];
    
    self.indoorBuilding = indoorBuilding;
    
    NSArray *ary = [self.mapView getFloorInfos];
    [self.floorsAry addObjectsFromArray:ary];
    
    
    
    
    
    _floorBarView = [[IndoorFloorHBar alloc] initWithFrame:CGRectMake(0,0,50, 80 )];
//    weakSelf.floorBarView = [[IndoorFloorHBar alloc] init];

    
    weakSelf.floorBarView.delegate = self;
    weakSelf.floorBarView.backgroundColor =[UIColor whiteColor];
    [weakSelf.mapView addSubview:weakSelf.floorBarView];
//    CGSize   zsiza = CGSizeMake(50, 80);

    
     [self.mapView subviews];
    

    [self.floorBarView setNeedsLayout];

    [weakSelf.floorBarView mas_updateConstraints:^(MASConstraintMaker *make) {
        
//        make.edges.mas_equalTo(weakSelf.mapView).insets(UIEdgeInsetsMake(300, 40, 40, 40));

        make.right.mas_equalTo(weakSelf.view.mas_right).equalTo(@(-10));
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).equalTo(@(-100));


        make.size.mas_equalTo(self.floorBarView.frame.size);

    }];
    
    [self.floorBarView.superview layoutIfNeeded];
    [self.floorBarView layoutSubviews];

    [self.floorBarView setData:ary startIndex:(int)1];
    
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
-(void)downloadMapDataFailed:(NSString *)buildid error:(NSError *)error
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


#pragma mark -  IndoorMapViewDelegate

- (void)didTapPoint:(CGPoint)point withFloorNum:(int)num withPoiArray:(NSArray *)array
{
    
    
    if([array count]<=0)
        {
        self.poiView.hidden = YES;
        return ;
        }
    IndoorPoiInfo * indoor = [array objectAtIndex:0];
    
    self.markView  =[self.mapView addMarker:point withFloorNum:num withPoiInfo:indoor withImageName:@"default_map_select_point_normal"];
    
//    IndoorMarkerView * markView =[]
//    [self showPoiInfo:nil];
    
}

-(void)didLongPressPoint:(CGPoint)point withFloorNum:(int)num withPoiArray:(NSArray *)array
{

    self.poiView.hidden = YES;
    
}
-(void)didScaleChanged:(float)scale withScaleState:(kFEGLScaleState)state
{
    
}
-(void)didTapClick:(IndoorMarkerView *)idoorMView
{

    
    if (!isHidden) {
        _poiView = [[UIView alloc]initWithFrame:CGRectMake(0,-self.view.frame.size.height, 0, MAIN_SCREEN_WIDTH)];
        _poiView.backgroundColor = [UIColor blueColor];

        [self.mapView addSubview:self.poiView];
        [self.poiView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
            make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
            make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(200);
            make.height.mas_equalTo(200);
            
            
        }];
        [self.poiView.superview layoutIfNeeded];
        isHidden = YES;
        self.poiView.hidden =NO;

        [UIView animateWithDuration:2 animations:^{
            
            [self.poiView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
                make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
                make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(0);
                make.height.mas_equalTo(200);
            }];
            [self.poiView.superview layoutIfNeeded];

            
        }];
    }
    else
        {
        
        isHidden = NO;

        _poiView = [[UIView alloc]initWithFrame:CGRectMake(0,-self.view.frame.size.height, 0, MAIN_SCREEN_WIDTH)];
        _poiView.backgroundColor = [UIColor redColor];
        _poiView.hidden = NO;
        [self.mapView addSubview:self.poiView];
        [self.poiView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
            make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
            make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(200);
            make.height.mas_equalTo(200);
            
            
        }];
        [self.poiView.superview layoutIfNeeded];
        
        [UIView animateWithDuration:1 animations:^{
            
            [self.poiView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
                make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
                make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(0);
                make.height.mas_equalTo(200);
                
                
            }];
            [self.poiView.superview layoutIfNeeded];
            

        }];


        }


//    if (!self.isHidden) {
//
//        self.poiView.hidden = NO;
//        self.isHidden = YES;
//        [UIView animateWithDuration:2 animations:^{
//            
//            [self.poiView mas_updateConstraints:^(MASConstraintMaker *make) {
//                
//                make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
//                make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
//                make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(0);
//                make.height.mas_equalTo(200);
//
//                
//            }];
//            [self.poiView.superview layoutIfNeeded];
//        } ];
//    }
//    else
//        {
//        self.isHidden = NO;
//        self.poiView.hidden = YES;
//        [self.poiView mas_updateConstraints:^(MASConstraintMaker *make) {
//            
//            make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
//            make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
//            make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(0);
//            make.height.mas_equalTo(200);
//            
//            
//        }];
//        [self.poiView.superview layoutIfNeeded];
////        [UIView animateWithDuration:2 animations:^{
////            
////            [_poiView mas_makeConstraints:^(MASConstraintMaker *make) {
////                
////                make.height.mas_equalTo(200);
////
////                make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
////                make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
////                make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(0);
////                
////                
////            }];
////            [self.poiView.superview layoutIfNeeded];
////        } completion:^(BOOL finished) {
//        
////            [UIView animateWithDuration:2 animations:^{
////                [_poiView mas_makeConstraints:^(MASConstraintMaker *make) {
////                    make.height.mas_equalTo(200);
////
////                    make.top.mas_equalTo(_mapView.mas_top).mas_equalTo(0);
////                    make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
////                    make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
////                }];
////                [self.poiView.superview layoutIfNeeded];
////            }];
//            
//            
//            
////        }];
//
//        }
    
   }

- (void)currentViewPortLocationX:(float)x withY:(float)y
{
    
}
#pragma mark self custom

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
//        idoorMView.contentMode = UIViewContentModeCenter;
//        [idoorMView setFrame:CGRectMake(0, 0, 100, 100)];
        self.selMarkView =idoorMView;
    }
    
}


-(void)tapToSearch:(UITapGestureRecognizer *)tapSingle{


    SerchViewController *SerchViewC = [[SerchViewController alloc]initWithNibName:@"SerchViewController" bundle:nil];
//    spc.selMarkView = self.selMarkView;
//    spc.userLocation = self.userLocation;
//    spc.spoid = self.spoiid;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    [self.navigationController pushViewController:SerchViewC animated:YES];
}

-(CGFloat)initContentHightFloat:(CGFloat)fontl andText:(NSString *)text andWidth:(CGFloat)with
{
    float height = 0.0f;
    CGSize size=CGSizeMake(with, MAXFLOAT);//可以限制宽 高度可以任意
    
        //下面方法中需要的参数 注意:字体的大小要和上面设置字体大小的一直
    NSDictionary * dic=@{NSFontAttributeName:[UIFont systemFontOfSize:fontl]};
    
        //同上面的字典一样也是下面方法需要的参数
        // NSStringDrawingUsesLineFragmentOrigin 表示矩形区域的高度被忽略
        // NSStringDrawingUsesFontLeading     表示计算之后的矩形区域包括行间距
        //计算高度
    CGRect  rect =   [text  boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dic context:nil];
    
    height = rect.size.height;
    return height;
}
#pragma mark - view self custom

//- (UIView *)poiView
//{
//
//    if (!_poiView) {
//        _poiView = [[UIView alloc]initWithFrame:CGRectMake(0,-self.view.frame.size.height, 0, MAIN_SCREEN_WIDTH)];
//        _poiView.backgroundColor = [UIColor blueColor];
//        _poiView.hidden = YES;
//        [self.mapView addSubview:self.poiView];
//        [self.poiView mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.left.mas_equalTo(_mapView.mas_left).mas_equalTo(0);
//            make.right.mas_equalTo(_mapView.mas_right).mas_equalTo(0);
//            make.bottom.mas_equalTo(_mapView.mas_bottom).mas_equalTo(200);
//            make.height.mas_equalTo(200);
//            
//            
//        }];
//        [self.poiView.superview layoutIfNeeded];
//
//
//                           }
//    return _poiView;
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
