//
//  LinkPathMacro.h
//  SpecializedDemo
//
//  Created by 邵瑞 on 15/12/17.
//  Copyright © 2015年 wondersInfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkPathMacro : NSObject
//
//  commonText.h
//  xyzp
//
//  Created by shaorui on 15/9/10.
//  Copyright (c) 2015年 WondersGroup. All rights reserved.
//

#ifndef xyzp_commonText_h
#define xyzp_commonText_h
//
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)



//
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
//
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
//判断是否为iPhone 4
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

//判断是否为iPhone 6

#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
//判断是否为iPhone 6p

#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//判断是否为iPhone5
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f



//颜色值转换  0b 八进制         0x 十六进制
#define Color(r,g,b,a) [UIColor colorWithRed:(r/(float)255) green:(g/(float)255) blue:(b/(float)255) alpha:a]

#define PI 3.14159265358979323846

#define AlertView_Title_Text        @"提示"                         //提示标题文本
#define AlertView_CancelButon_Text  @"取消"                         //提示取消按钮文本
#define headerPullToRefreshTextkey  @"下拉可以刷新了"
#define headerReleaseToRefreshTextkey @"松开马上刷新了"
#define headerRefreshingTextKey @"正在刷新中..."

#define footerPullToRefreshTextKey  @"上拉可以加载更多数据了"
#define footerReleaseToRefreshTextKey @"松开立即加载更多数据了"

#define footerRefreshingTextKey @"正在加载中..."

//在我中的几个本地拼组的数据结构的 key
#define leftImageKey @"leftImage" //显示在左边对应的提示图标
#define rightLabTextKey @"rightLabText" //通知消息提示的文本字段
#define centerLableTextKey @"centerLableText" //功能提示中间的文本字段

#define arrowImageKey @"arrowImage"//箭头的小图标
#define BUNDLE_NAME @"Resource"

#define IMAGE_NAME @"UIApplicationDefaultImage"
#define IMAGE_EXT @"png"

#define CONTENT NSLocalizedString(@"TEXT_SHARE_CONTENT", @"渝才通应用分享")
#define SHARE_URL @"http://www.mob.com"


/*屏幕大小*/
#define MAIN_SCREEN_FRAME [[UIScreen mainScreen]  bounds]
//设备屏幕宽度

#define MAIN_SCREEN_WIDTH [[UIScreen mainScreen]  bounds].size.width
//设备屏幕高度

#define MAIN_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

#define ORIGINAL_MAX_WIDTH 640.0f


//IOS 字符串为空判断
#define strIsJudgeEmpty(str) (str == nil ||[str isEqualToString:@"<null>"]||[str isEqualToString:@"(null)"]|| [str isKindOfClass:[NSNull class]] || [str length]<1 ? YES : NO )

#endif
@end
