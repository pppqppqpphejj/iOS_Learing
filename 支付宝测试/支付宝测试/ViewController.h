//
//  ViewController.h
//  支付宝测试
//
//  Created by ZouXu on 16/3/29.
//  Copyright © 2016年 ZouXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Product : NSObject{
    @private
    float _price; /** 价格 */
    NSString *_subject;
    NSString *_body;
    NSString *_orderId; /** 订单编号 */
}

@property(nonatomic,assign)float price;
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *body;
@property(nonatomic,copy)NSString *orderId;


@end

@interface ViewController : UIViewController

@property(nonatomic,strong)NSMutableArray *productList;
@property(nonatomic,strong)UITableView *productTableView;
@end

