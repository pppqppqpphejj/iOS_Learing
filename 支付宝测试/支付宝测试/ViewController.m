//
//  ViewController.m
//  支付宝测试
//
//  Created by ZouXu on 16/3/29.
//  Copyright © 2016年 ZouXu. All rights reserved.
//

#import "ViewController.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation Product

@end

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self generateDate];
    [self.view addSubview:self.productTableView];
}

/** 初始化数据源 */
-(void)generateDate{
    
/* 订单商品描述 描述*/
    NSArray *subjects =  @[@"1",
                           @"2",@"3",@"4",
                           @"5",@"6",@"7",
                           @"兰博基尼LP730",@"9",@"10"];
    
    NSArray *body = @[@"奔驰GLK300",@"宝马Z4",@"奥迪A9",@"劳斯莱斯银狐",@"劳斯莱斯幻影",@"保时捷911",@"法拉利F480",@"兰博基尼LP730",@"奥迪R8",@"保时捷卡宴"];
    if (self.productList == nil) {
        self.productList = [[NSMutableArray alloc]init];
    }else{
        [self.productList removeAllObjects];
    }
    for (int i = 0; i < subjects.count; i++) {
        Product *product = [[Product alloc]init];
        product.subject = [subjects objectAtIndex:i];
        product.body = [body objectAtIndex:i];
        
        product.price = 0.01f+0.01f*i;
        [self.productList addObject:product];
    }
}

/** 随机产生15位订单号 */
-(NSString *)gennerateTradeNo{
    static int kNumber = 15;
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc]init];
    srand((unsigned)time(0));
    for (int i = 0; i<kNumber; i++) {
        unsigned index = rand()%[sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

//-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return [NSString stringWithFormat:@"商户:李登杰"];
//}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,80)];
    label.text = @"商户:李登杰";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:30];
    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _productList.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    Product *product = [self.productList objectAtIndex:indexPath.row];
    cell.textLabel.text = product.body;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"优惠价：%.2f元",product.price];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    /*
     *点击获取prodcut实例并初始化订单信息
     */
    Product *product = [self.productList objectAtIndex:indexPath.row];
    
    /** ------ 填写商户自己申请的APPKEY */
    NSString *partner = @"2088121511093852";
    NSString *seller = @"frank@gulutrip.com"; /** 卖家支付宝 */
    NSString *privatekey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMk5SJdCBCu4+nH4WKx4qxghMxRzR8fLFZ7yXi9CNaBdrg+TzpBAvc7/4m3S7nQW5lsGxbZ9es73PmdcVb7n6YOS/bpZ2243Achq7HN82k4cfW1pz9s7lGPN1VrgrHznpauUW0LVEGnSWAtlFq2dMks48RyZXqoFpqHuCN9w4+nbAgMBAAECgYAxmVcVQYZ5qHzC/u4MhSnXJsfKcKfuzVYk+aTRjUZeovi2ij5OPEcM8PHFFEsGfmaFZWPymXdd8H+HRrEz/0IFZgNM8jFHXX1oRen+JlqgT790vcBnKmt3sg3K2aBhfxGBUJglyKO2GJPq/DKg7xvu9G1lpzzNYBRRB5VVH6hbMQJBAPv/4zRKgLcbOpKydtOc+chCMDm3p4ExI0qvkStkFNP0f1rdaRrK+lzwiYEwfd4Cb2yBADJ/PIgYDjZXzpj1HkUCQQDMawvEs+0LMAbVwAYZxqcsdTulul7aEpYo21qYS04ALw8YaR2zZsRNJssSbvbDc7doNoUcotE4b2dASoV/MfmfAkEAxoF+z400sYiQbkiI1A8esAJ7jKvAFkPH4ihEuaJ/yasau1AYYFOuPpH4Lz0smTrf3OANcLnLzATvBR3MD69e5QJAFyGl20Rg9nsgyt9H0XLhR+6cKUzFnverdkQcJE+hK/QnSSPb8IkYfYJ+SD+2PLfDcU96EJt8AV7Z2DSWlqYZEQJAKUqC5usvUpa4l9y8ruI0fhiWYw9dEYGaj6zQWBSMz/iUkgJQWuXwHt906i3H6f0IFA51wI1/cNV5Hs/F3MFMkQ=="; /** 私钥 */
    
    
    // partner和seller获取失败提示
    if ([partner length] ==0 || [seller length]==0 || [privatekey length]==0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示：" message:@"缺少partner或者seller" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    /** ------ 生成订单信息及签名 */
    Order *order = [[Order alloc]init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self gennerateTradeNo];/** 订单ID */
    order.productName = product.subject;/** 商品名 */
    order.productDescription = product.body;/** 商品描述 */
    order.amount = [NSString stringWithFormat:@"%.2f",product.price];/** 价格 */
    order.notifyURL = @"http://www.baidu.com"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"zxxx";
    
    // 将商品信息转接成字符串
    NSString *orderSpec = [order description];
//    NSLog(@"---------%@",orderSpec);
    
    /** ------ 获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode */
    id<DataSigner>singer = CreateRSADataSigner(privatekey);
    NSString *signedString = [singer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        /** 支付 */
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"=== %@",resultDic);
            
        }];
    }
}



-(UITableView *)productTableView{
    if (!_productTableView) {
        _productTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    }
    _productTableView.delegate = self;
    _productTableView.dataSource = self;
    return _productTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
