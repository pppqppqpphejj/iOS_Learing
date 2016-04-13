//
//  AppDelegate.m
//  BorderDemo
//
//  Created by 浩GG on 15/3/17.
//  Copyright (c) 2015年 YaoYu. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

//   LaunchScreenViewController  *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
//    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"LaunchScreen" owner:self options:nil];
//
//
//    UIView *launchView = [nibArray objectAtIndex:0];
//
//    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
//    UIWindow *mainWindow = delegate.window;
//    [mainWindow addSubview:launchView];
//    
//    [UIView animateWithDuration:0.6f delay:0.5f options:UIViewAnimationOptionShowHideTransitionViews animations:^{
//        launchView.alpha = 0.5f;
//        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
//    } completion:^(BOOL finished) {
//        [launchView removeFromSuperview];
//    }];
//    [NSThread sleepForTimeInterval:3.0];

    NSLog(@"动画执行之前的位置：%@",NSStringFromCGPoint(self.window.center));
    CGRect r = [ UIScreen mainScreen ].bounds;
    CGFloat width= r.size.width;
    CGFloat height=r.size.height;
    [self.window makeKeyAndVisible];
    UIImageView *splashView=[[UIImageView alloc] initWithFrame:r];
    [splashView setImage:[UIImage imageNamed:@"welcome.png"]];
        //添加到场景
    [self.window addSubview:splashView];
        //放到最顶层
    [self.window bringSubviewToFront:splashView];
        //开始设置动画
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.window cache:YES];
    [splashView setAlpha:0];
        //设置代理
    [UIView setAnimationDelegate:self];
    splashView.alpha=2.0;
    splashView.frame=CGRectMake(0, 0, width, height);
        //设置动画加载完成的回调函数
    [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
    [UIView commitAnimations];
    MainViewController *main=[[MainViewController alloc] init];
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:main];
    nav.navigationBarHidden = YES;
    
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
       return YES;
}
-(void)didStopAnimation
{



}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
