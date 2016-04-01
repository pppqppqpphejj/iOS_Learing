//
//  WXApiRequestHandler.m
//  WXPayForIOS
//
//  Created by ssiwo02 on 15/12/29.
//  Copyright © 2015年 疯狂的地垄沟. All rights reserved.
//

#import "WXApi.h"
#import "WXApiRequestHandler.h"
#import "WXApiManager.h"
#import "Http.h"
#import "XMLReader.h"
#import "Header.h"
#import "MD5.h"
@interface WXApiRequestHandler()
@property (nonatomic, copy) NSString *timeStamp;
@property (nonatomic, copy) NSString *nonceStr;
@property (nonatomic, copy) NSString *traceId;
@end
@implementation WXApiRequestHandler

#pragma mark - 访问后台，请求数据。
/*调用统一下单接口，签名加密等步骤，全部后台处理，后台给前端一个接口，前端访问接口，后台返回调用微信app支付所需必须参数，成功调起微信支付*/
//  调用微信支付
+(void)sendWXpay{
    //获的后台接口
    NSString *url = [NSString stringWithFormat:SERVER_URL];
    NSDictionary *dict = [Http request:url];
    NSLog(@"dict  : %@", dict);
    //调用支付接口
    PayReq *payRequest = [[PayReq alloc]init];
    
    payRequest.partnerId = [[dict objectForKey:@"partnerId"] objectForKey:@"text"];
    payRequest.prepayId = [[dict objectForKey:@"prepayId"] objectForKey:@"text"];
    payRequest.package = [[dict objectForKey:@"package"] objectForKey:@"text"];
    payRequest.nonceStr = [[dict objectForKey:@"nonceStr"] objectForKey:@"text"];
    payRequest.timeStamp = [[[dict objectForKey:@"timeStamp"] objectForKey:@"text"] intValue];
    payRequest.sign = [[dict objectForKey:@"paySign"] objectForKey:@"text"];
    
    [WXApi sendReq:payRequest];
    
    
    
}
#pragma mark - 模拟后台，所有请求全部前端完成
+(void)sendWXpayWithServer{
    
    //调用微信统一下单接口
    NSString *url = [NSString stringWithFormat:@"https://api.mch.weixin.qq.com/pay/unifiedorder"];
    /*微信统一下单接口 参见官网  https://pay.weixin.qq.com/wiki/doc/api/app.php?chapter=9_1*/
    
    // 拼接详细的订单数据
    NSDictionary *postDict = [self getProductArgs];
    //拼接调用支付接口所需要的参数
    NSString *string = [NSString stringWithFormat:@"<xml><sign>%@</sign><appid>%@</appid><body>%@</body><mch_id>%@</mch_id><nonce_str>%@</nonce_str><notify_url>%@</notify_url><out_trade_no>%@</out_trade_no><spbill_create_ip>%@</spbill_create_ip><total_fee>%d</total_fee><trade_type>APP</trade_type></xml>",[postDict objectForKey:@"sign"], APPID, [postDict objectForKey:@"body"], PartnerId, [postDict objectForKey:@"nonce_str"], [postDict objectForKey:@"notify_url"], [postDict objectForKey:@"out_trade_no"], [postDict objectForKey:@"spbill_create_ip"],[[postDict objectForKey:@"total_fee"] intValue]];
    
    //创建网络请求
    NSURL *requestURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request  = [[NSMutableURLRequest alloc]initWithURL:requestURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[string dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
        
        NSError *error2 = [NSError alloc];
        NSDictionary *xmlDict = [[XMLReader dictionaryForXMLString:result error:&error2] objectForKey:@"xml"];
        NSLog(@" 解析出来的xml    ：  %@", xmlDict);
        
        //调用支付接口
        PayReq *payRequest = [[PayReq alloc]init];
        payRequest.partnerId = [[xmlDict objectForKey:@"mch_id"] objectForKey:@"text"];
        payRequest.prepayId = [[xmlDict objectForKey:@"prepay_id"] objectForKey:@"text"];
        payRequest.package = @"Sign=WXPay";
        payRequest.nonceStr = [[xmlDict objectForKey:@"nonce_str"] objectForKey:@"text"];
        payRequest.timeStamp = [[self genTimeStamp] intValue];
        
        //构造参数列表,再次签名
        NSMutableDictionary *payDict = [NSMutableDictionary dictionary];
        [payDict setObject:APPID forKey:@"appid"];
        [payDict setObject:payRequest.nonceStr forKey:@"noncestr"];
        [payDict setObject:payRequest.package forKey:@"package"];
        [payDict setObject:payRequest.partnerId forKey:@"partnerid"];
        [payDict setObject:payRequest.prepayId forKey:@"prepayid"];
        [payDict setObject:[NSString stringWithFormat:@"%u", (unsigned int)payRequest.timeStamp]forKey:@"timestamp"];
        payRequest.sign = [self genSign:payDict];
        
        [WXApi sendReq:payRequest];
        
    }
    
    
}
#pragma mark - 生成各种参数
// 获取时间戳
+(NSString *)genTimeStamp
{
    //    return [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:unitFlags fromDate:[NSDate date]];
    
    NSString *TimeStamp = [NSString stringWithFormat:@"%ld%ld%ld%ld%ld%ld",(long)[dateComponent year], (long)[dateComponent month], (long)[dateComponent day], (long)[dateComponent hour], (long)[dateComponent minute], (long)[dateComponent second]];
    
    return TimeStamp;
    
}

/**
 *  获取32位内的随机串, 防重发
 *
 *  注意：商户系统内部的订单号,32个字符内、可包含字母,确保在商户系统唯一
 */
+(NSString *)genNonceStr
{
    return [MD5 md5:[NSString stringWithFormat:@"%d", arc4random() % 10000]];
}

/**
 *  获取商家对用户的唯一标识
 *
 *  traceId 由开发者自定义，可用于订单的查询与跟踪，建议根据支付用户信息生成此id
 *  建议 traceid 字段包含用户信息及订单信息，方便后续对订单状态的查询和跟踪
 */
+(NSString *)genTraceId
{
    return [NSString stringWithFormat:@"%@", [self genTimeStamp]];
}

// 签名
+(NSString *)genSign:(NSDictionary *)signParams
{
    // 排序
    NSArray *keys = [signParams allKeys];
    NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    // 生成
    NSMutableString *sign = [NSMutableString string];
    for (NSString *key in sortedKeys) {
        [sign appendString:key];
        [sign appendString:@"="];
        [sign appendString:[signParams objectForKey:key]];
        [sign appendString:@"&"];
    }
    [sign appendString:@"key="];
    [sign appendString:Partner_Sign_Key];// 注意:不能hardcode在客户端,建议genPackage这个过程都由服务器端完成
    
    NSString *result = [[MD5 md5:sign] uppercaseString];
    
    return result;
    
}

// 构造预付订单参数列表
+(NSDictionary *)getProductArgs
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSString *timeStamp = [self genTimeStamp];   // 获取时间戳
    NSString *nonceStr = [[self genNonceStr] uppercaseString];     // 获取32位内的随机串, 防重发
    // 获取商家对用户的唯一标识
    
    NSString *outTradNo = [NSString stringWithFormat:@"%d", arc4random() % 10000];
    NSString * out_trade_no= [NSString stringWithFormat:@"%@%@",timeStamp,outTradNo];//获取商户订单号
    
    [params setObject:APPID forKey:@"appid"];//必填
    [params setObject:nonceStr forKey:@"nonce_str"];//随机字符串，必填
    [params setObject:@"APP" forKey:@"trade_type"]; //交易类型 必填
    [params setObject:@"iOS微信app支付——疯狂的地垄沟" forKey:@"body"];//商品描述，必填
    [params setObject:NOTIFY_URL forKey:@"notify_url"];//此处填可以让后台写个接口，如果支付成功，则微信后台调用此接口，返回yes,失败则返回no；
    [params setObject:out_trade_no forKey:@"out_trade_no"];//商户订单号，必填
    [params setObject:PartnerId forKey:@"mch_id"];
    [params setObject:[MD5 getIPAddress:YES] forKey:@"spbill_create_ip"];//终端ip，必填
    [params setObject:@"1" forKey:@"total_fee"];
    //签名
    [params setObject:[self genSign:params] forKey:@"sign"];
    
    return params;
    
}

#pragma mark - 支付结果
- (void)getOrderPayResult:(NSNotification *)notification
{
    if ([notification.object isEqualToString:@"success"])
    {
        NSLog(@"success: 支付成功");
    }
    else
    {
        NSLog(@"fail: 支付失败");
    }
}
@end
