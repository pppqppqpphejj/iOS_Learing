//
//  RootViewController.m
//  ButtonView
//
//  Created by 邵瑞 on 15/10/24.
//  Copyright © 2015年 wonders_ButtonView. All rights reserved.
//

#import "RootViewController.h"
#import "RootView.h"
#import "ColorView.h"
#import "ButtonView.h"
#import "TouchView.h"
@interface RootViewController ()<TouchViewDelegate>
//将试图设置为试图控制器所 对应的视图(也就是将RootView代替controller⾃自⼰己本⾝身的视图self.view = _rv;)。
@property (strong,nonatomic) IBOutlet RootView * rv;

@property (strong,nonatomic) IBOutlet ButtonView * bv;
@property (strong,nonatomic)  TouchView * touch;
@property (strong,nonatomic)  NSArray * arrBGTouchImage;

@end

@implementation RootViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    
    return self;
}

-(void)changColor:(TouchView *)viewColor
{
    
    
    viewColor.backgroundColor = [UIColor
                             colorWithRed:arc4random() % 256/255.0 green:arc4random() %
                             256/255.0 blue:arc4random() % 256/255.0 alpha:1];

}

-(void)changSelfBGImage:(TouchView *)imageStr
{
    
    NSInteger imageIndex = arc4random() % [_arrBGTouchImage count];
    
    imageStr.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[_arrBGTouchImage objectAtIndex:imageIndex]]];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrBGTouchImage = @[@"1.png",@"2.png",@"3.png",@"4.png"];
    
    _touch = [[TouchView alloc] init];
    _touch.frame = CGRectMake(0, 0,200,100);

    _touch.delegate = self;

//    //初始化一个Invocation对象
//    NSInvocation * invo = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:@selector(init)]];
//    [invo setTarget:self];
//    [invo setSelector:@selector(change)];
//    NSTimer * timer = [NSTimer timerWithTimeInterval:1 invocation:invo repeats:YES];
//    //加入主循环池中
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//    //开始循环
//    [timer fire];
    


//        self.rv = [[RootView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//
//    self.view = self.rv;
    self.view.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.touch];
    //添加tarage 事件
//    [self.rv.bv myAddTarget:self action:@selector(bvAction:)];
    [self.bv myAddTarget:self action:@selector(bvAction:)];
//    是我们在ButtonView中定义的⼀一个⽅方法
    // Do any additional setup after loading the view from its nib.
}

//添加tarage事件
-(void)bvAction:(ButtonView *)bv
{
    
    
    
    
    NSLog(@"is ButtonView view action");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
