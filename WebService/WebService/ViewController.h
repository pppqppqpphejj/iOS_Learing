//
//  ViewController.h
//  WebService
//
//  Created by aJia on 12/12/12.
//  Copyright (c) 2012年 rang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoapHelper/SoapHelper.h"
#import "ServiceHelper.h"
#import "MBProgressHUD.h"
@interface ViewController : UIViewController<MBProgressHUDDelegate,ServiceHelperDelegate,NSXMLParserDelegate>{
    ServiceHelper *helper;
    MBProgressHUD *HUD;
}
//同步请求
- (IBAction)buttonSyncClick:(id)sender;
//异步请求
- (IBAction)buttonAsycClick:(id)sender;
//队列请求
- (IBAction)buttonQueueClick:(id)sender;

//显示请求信息
-(void)startLoadAnimation:(NSString*)msg;
@end
