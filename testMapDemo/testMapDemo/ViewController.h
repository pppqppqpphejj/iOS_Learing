//
//  ViewController.h
//  testMapDemo
//
//  Created by 邵瑞 on 16/3/7.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IndoorMapView.h"

@class IndoorEn;
@class PointD;
@interface ViewController : UIViewController
/**
 *buildid 室内建筑 id
 *
 **/
@property (strong,nonatomic) NSString *buildId;
/**
 *@属性描述
 *建筑物名称
 **/
@property (strong,nonatomic) NSString *buildName;
/**
 *@属性描述
 *起始楼层
 **/
@property (strong,nonatomic) NSString *startFool;
/**
 *@属性描述
 *楼层名称
 **/
@property(nonatomic,strong) IBOutlet UILabel   *floorLabel;
/**
 *@属性描述
 *已标注的商户名称
 **/
@property(nonatomic,strong) IBOutlet UILabel   *nameLabel;
/**
 *@属性描述
 *到这里
 **/
@property(nonatomic,strong) IBOutlet UIButton   *goBtn;


/**
 *@属性描述
 *弹出视图
 **/
@property(nonatomic,strong) IBOutlet UIView           *poiView;
- (void)loadSearchPoi:(IndoorEn *)en;
- (void)loadSearchAllPoi:(NSArray *)pois;

/**
 * @描述
 * @参数值
 * @返回
 **/
-(void)dd;
@end

