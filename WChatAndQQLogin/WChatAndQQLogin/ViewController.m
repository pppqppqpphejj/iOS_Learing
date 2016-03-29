//
//  ViewController.m
//  WChatAndQQLogin
//
//  Created by 邵瑞 on 16/3/29.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic)   UIButton *btnWX;
@property (strong, nonatomic)   UIButton *btnQQ;
@property (strong, nonatomic)   IBOutlet  UIButton *btnWXA;
@property (strong, nonatomic)  IBOutlet  UIButton *btnQQB;
- (IBAction)btnWXAction:(id)sender;

- (IBAction)btnQQAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
}
@end
