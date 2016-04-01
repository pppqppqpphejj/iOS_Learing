//
//  ViewController.m
//  TestQQLogin
//
//  Created by 西游 on 6/9/15.
//  Copyright (c) 2015 com.xiyou. All rights reserved.
//

#import "ViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface ViewController ()<TencentSessionDelegate>
{
    UIButton *qqLoginBtn;
    TencentOAuth *tencentOAuth;
    NSArray *permissions;
    UILabel *resultLable;
    UILabel *tokenLable;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1，初始化登陆按钮 添加到当前view中
    qqLoginBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    qqLoginBtn.frame=CGRectMake(100, 50, 36, 36);
    [qqLoginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [qqLoginBtn addTarget:self action:@selector(loginAct) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:qqLoginBtn];
    
    //2,初始 lable
    resultLable=[[UILabel alloc]initWithFrame:CGRectMake(30, 100, 200, 36)];
    tokenLable=[[UILabel alloc]initWithFrame:CGRectMake(30, 150, 200, 36)];
    [self.view addSubview:resultLable];
    [self.view addSubview:tokenLable];
    
    //3,初始化TencentOAuth 对象 appid来自应用宝创建的应用， deletegate设置为self  一定记得实现代理方法
    
    //这里的appid填写应用宝得到的id  记得修改 “TARGETS”一栏，在“info”标签栏的“URL type”添加 的“URL scheme”，新的scheme。有问题家QQ群414319235提问
//    1104936042(有位)
//    1104617535
//    plist tencent1104617535
;
    tencentOAuth=[[TencentOAuth alloc]initWithAppId:@"1104936042" andDelegate:self];
    
    //4，设置需要的权限列表，此处尽量使用什么取什么。
    permissions= [NSArray arrayWithObjects:@"get_user_info", @"get_simple_userinfo", @"add_t", nil];
    
}
#pragma mark -- login
-(void)loginAct
{
    NSLog(@"loginAct");
    [tencentOAuth authorize:permissions inSafari:NO];
}

#pragma mark -- TencentSessionDelegate
//登陆完成调用
- (void)tencentDidLogin
{
    resultLable.text = @"登录完成";
    
    if (tencentOAuth.accessToken && 0 != [tencentOAuth.accessToken length])
    {
        //  记录登录用户的OpenID、Token以及过期时间
        tokenLable.text = tencentOAuth.accessToken;
        [tencentOAuth getUserInfo];
    }
    else
    {
        tokenLable.text = @"登录不成功 没有获取accesstoken";
    }
}

//非网络错误导致登录失败：
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    NSLog(@"tencentDidNotLogin");
    if (cancelled)
    {
        resultLable.text = @"用户取消登录";
    }else{
        resultLable.text = @"登录失败";
    }
}
// 网络错误导致登录失败：
-(void)tencentDidNotNetWork
{
    NSLog(@"tencentDidNotNetWork");
    resultLable.text = @"无网络连接，请设置网络";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
