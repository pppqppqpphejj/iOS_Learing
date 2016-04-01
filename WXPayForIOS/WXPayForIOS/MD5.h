//
//  MD5.h
//  WXPayForIOS
//
//  Created by ssiwo02 on 15/12/29.
//  Copyright © 2015年 疯狂的地垄沟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5 : NSObject
+ (NSString *)md5:(NSString *)input;

+ (NSString *)sha1:(NSString *)input;

+ (NSString *)getIPAddress:(BOOL)preferIPv4;

+ (NSDictionary *)getIPAddresses;
@end
