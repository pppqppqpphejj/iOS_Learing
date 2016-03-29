//
//  ViewController.m
//  WChatAndQQLogin
//
//  Created by 邵瑞 on 16/3/29.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<TencentLoginDelegate>
@property (strong, nonatomic)   UIButton *btnWX;
@property (strong, nonatomic)   UIButton *btnQQ;
@property (strong, nonatomic)   IBOutlet  UIButton *btnWXA;
@property (strong, nonatomic)  IBOutlet  UIButton *btnQQB;

@property (strong,nonatomic) TencentOAuth *tencentOAuth;
@property (strong,nonatomic) NSArray *permissions;
@property(strong,nonatomic) UILabel *resultLable;
@property(strong,nonatomic) UILabel *tokenLable;
- (IBAction)btnWXAction:(id)sender;

- (IBAction)btnQQAction:(id)sender;
@end

@implementation ViewController
@synthesize tencentOAuth = _tencentOAuth;

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.resultLable  = [[UILabel alloc] init];
    self.tokenLable  = [[UILabel alloc] init];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(display) name:@"NotDisPlay" object:nil];
    [self.view setBackgroundColor:[UIColor whiteColor]];


    MyWeakObject(self);
    self.btnWX = [[UIButton alloc] init];
    [self.btnWX addTarget:self action:@selector(btnWXAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.btnWX setTitle:@"微信" forState:UIControlStateNormal];
    [self.btnWX setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.btnWX];
    self.btnQQ = [[UIButton alloc] init];
    [self.btnQQ setBackgroundColor:[UIColor orangeColor]];
    [self.btnQQ setTitle:@"QQ" forState:UIControlStateNormal];
    [self.btnQQ addTarget:self action:@selector(btnQQAction:) forControlEvents:UIControlEventTouchUpInside];


    [self.view addSubview:self.btnQQ];
    self.btnQQ.translatesAutoresizingMaskIntoConstraints = NO;
    self.btnWX.translatesAutoresizingMaskIntoConstraints = NO;
    [self.btnWX mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_equalTo(120);
        make.right.mas_equalTo(self.view.mas_right).mas_equalTo(-30);

        make.width.equalTo(@80);
        make.height.equalTo (@45);
    

    }];
    
    [weakSelf.btnQQ  mas_makeConstraints:^(MASConstraintMaker *make) {
       

        make.left.mas_equalTo(self.view.mas_left).mas_equalTo(10);
        make.top.mas_equalTo(self.view.mas_top).mas_equalTo(120);

        make.size.mas_equalTo(CGSizeMake(80,45));
        
    }];
    


    [self.btnWXA setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.btnWXA];

    [self.btnQQB setBackgroundColor:[UIColor grayColor]];

    [self.view addSubview:self.btnQQB];
    self.btnQQB.translatesAutoresizingMaskIntoConstraints = NO;
    self.btnWXA.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.btnWXA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_equalTo(220);
        make.right.mas_equalTo(self.view.mas_right).mas_equalTo(330);
        
        make.width.equalTo(@80);
        make.height.equalTo (@45);

        
    }];
    
    [weakSelf.btnQQB  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.mas_equalTo(self.view.mas_left).mas_equalTo(10);
        make.top.mas_equalTo(self.view.mas_top).mas_equalTo(220);
        
        make.size.mas_equalTo(CGSizeMake(80,45));
        
    }];
    
    



    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//授权登录
- (IBAction)btnWXAction:(id)sender {
    
    SendAuthReq *req =[[SendAuthReq alloc ] init];
    req.scope = @"snsapi_userinfo"; // 此处不能随意改
    req.state = kTestSendState; // 这个貌似没影响
    [WXApi sendReq:req];

    
    
}
    // 显示昵称和头像
- (void)display {
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *str = appdelegate.nickname;
    NSLog(@"display.nickname = %@", str);
    [self.btnWX setTitle:str forState:UIControlStateNormal];
    
    NSString *url = appdelegate.headimgurl;
    NSLog(@"display.url = %@", url);
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    [self.btnWX setBackgroundImage:image forState:UIControlStateNormal];

}


- (IBAction)btnQQAction:(id)sender {
    _tencentOAuth  = [[TencentOAuth  alloc] initWithAppId:kTestQQLoginAppID andDelegate:self];
        //4，设置需要的权限列表，此处尽量使用什么取什么。
    self.permissions= [NSArray arrayWithObjects:@"get_user_info", @"get_simple_userinfo", @"add_t", nil];
    
    NSLog(@"loginAct");
    [self.tencentOAuth authorize:self.permissions inSafari:NO];
}
#pragma mark -- TencentSessionDelegate
    //登陆完成调用
- (void)tencentDidLogin
{
    self.resultLable.text = @"登录完成";
    
    if (self.tencentOAuth.accessToken && 0 != [self.tencentOAuth.accessToken length])
        {
            //  记录登录用户的OpenID、Token以及过期时间
        self.tokenLable.text = self.tencentOAuth.accessToken;
        [self.btnQQ setTitle:self.tokenLable.text  forState:UIControlStateNormal];

        [self.tencentOAuth getUserInfo];
        }
    else
        {
        self.tokenLable.text = @"登录不成功 没有获取accesstoken";
        
        [self.btnQQ setTitle:self.resultLable.text  forState:UIControlStateNormal];
        }
}

    //非网络错误导致登录失败：
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    NSLog(@"tencentDidNotLogin");
    if (cancelled)
        {
       self.resultLable.text = @"用户取消登录";
        [self.btnQQ setTitle:self.resultLable.text  forState:UIControlStateNormal];

        }else{
            self.resultLable.text = @"登录失败";
            [self.btnQQ setTitle:self.resultLable.text  forState:UIControlStateNormal];

        }
}
    // 网络错误导致登录失败：
-(void)tencentDidNotNetWork
{
    NSLog(@"tencentDidNotNetWork");

    [self.btnQQ setTitle:@"无网络连接，请设置网络" forState:UIControlStateNormal];
}

-(void)getUserInfoResponse:(APIResponse *)response
{
    NSLog(@"respons:%@",response.jsonResponse);
    [self.btnQQ setTitle:[response.jsonResponse valueForKey:@"nickname"] forState:UIControlStateNormal];

}



@end
