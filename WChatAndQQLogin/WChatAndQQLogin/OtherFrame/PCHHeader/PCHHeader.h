//
//  PCHHeader.h
//  WChatAndQQLogin
//
//  Created by 邵瑞 on 16/3/29.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#ifndef PCHHeader_h
#define PCHHeader_h

#import "AppDelegate.h"
#import "Masonry.h"
#import "WechatAuthSDK.h"
#import "WXApi.h"
#import "WXApiObject.h"
#define  kTestWeiXinAppId @"wx4868b35061f87885"//:微信申请下来的AppId
#define kTestWeiXinSecret @"64020361b8ec4c99936c0e3999a9f249"//:微信申请下来的AppSecret
#define  kTestSendState @"123"//:与第一步位置二内容相同即可

//防止循环造成循环引用
#define MyWeakObject(obj) __weak typeof(obj) weakSelf = obj;
    // 定义这个常量,就可以在使用Masonry不必总带着前缀 `mas_`:
#define MAS_SHORTHAND
    // 定义这个常量,以支持在 Masonry 语法中自动将基本类型转换为 object 类型:
#define MAS_SHORTHAND_GLOBALS

#endif /* PCHHeader_h */
