//
//  Order.h
//  AlixPayDemo
//
//  Created by 方彬 on 11/2/13.
//
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property(nonatomic, copy) NSString * partner;
@property(nonatomic, copy) NSString * seller;
@property(nonatomic, copy) NSString * tradeNO; /** 订单ID */
@property(nonatomic, copy) NSString * productName; /** 商品名 */
@property(nonatomic, copy) NSString * productDescription; /** 商品描述 */
@property(nonatomic, copy) NSString * amount;/** 商品价格 */
@property(nonatomic, copy) NSString * notifyURL; /** 回调地址 */

@property(nonatomic, copy) NSString * service;
@property(nonatomic, copy) NSString * paymentType;
@property(nonatomic, copy) NSString * inputCharset;
@property(nonatomic, copy) NSString * itBPay;
/*固定的 m.alipay.com ，未安装app 时打开网页*/
@property(nonatomic, copy) NSString * showUrl;


@property(nonatomic, copy) NSString * rsaDate;//可选
@property(nonatomic, copy) NSString * appID;//可选

@property(nonatomic, readonly) NSMutableDictionary * extraParams;


@end
