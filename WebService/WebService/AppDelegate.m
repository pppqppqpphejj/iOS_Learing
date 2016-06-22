//
//  AppDelegate.m
//  WebService
//
//  Created by aJia on 12/12/12.
//  Copyright (c) 2012年 rang. All rights reserved.
//

#import "AppDelegate.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@implementation AppDelegate

- (void)dealloc
{


}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [self requesini];
    // Override point for customization after application launch.
    return YES;
}

-(void)requesini
{

NSString *  xmlString =[NSString stringWithFormat:
                        @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                        "<tradeMsg>"
                        "<head>"
                        "<version>1.0.0</version>"
                        "<ref>O900082016042200000001</ref>"
                        "<sysCode>I90008</sysCode>"
                        "<busCode>SDRSLOGN</busCode>"
                        "<tradeSrc>O</tradeSrc>"
                        "<sender>O90008</sender>"
                        "<reciver>I90008</reciver>"
                        "<reSnd>N</reSnd>"
                        "<date>20160422</date>"
                        "<time>174811</time>"
                        "<rst>"
                        "<tradeCode>99</tradeCode>"
                        "<busiCode>9999</busiCode>"
                        "<info></info>"
                        "</rst>"
                        "</head>"
                        "<data>"
                        "<password>5f8591a3d4fe06393cad53edff27ba05</password>"
                        "<username>370102197605282527</username>"
                        "</data>"
                        "</tradeMsg>"];
NSString *  signature = @"CVhCGzSsryiZThqUwYayiW4UnLfysvos10hVMpR4JRowG0lujlZU8ei9jVxn+AmmGrEIaZtfTdvPqpghheI8ctY4NufDwJz4wV5uFxa9xB4YpGJmF+wKZ6kCBi9NJViE5S24LviZ3Ijb0CvVwqBLu0WlG3J6t3edANvMsKUxhuk=";

NSDictionary * param1 = @{
                          @"flag":@"0000001"
                          };

NSDictionary * param2 = @{
                          
                          @"xml":xmlString
                          };
NSDictionary * param3 = @{
                          
                          @"signature":signature
                          };
    //
NSDictionary * dicParam = @{
                            @"flag":@"00000001",
                            @"xml":xmlString,
                            @"signature":signature
                            
                            };

ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:defaultWebServiceUrl]];
[request setPostValue:@"00000001" forKey:@"flag"];
[request setPostValue:xmlString forKey:@"xml"];
[request setPostValue:signature forKey:@"signature"];
[request setDelegate:self];
[request startAsynchronous];


}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *ss = nil;
    ;
    if (request.responseStatusCode == 400) {
  ss= @"Invalid code";
    } else if (request.responseStatusCode == 403) {
       ss = @"Code already used";
    } else if (request.responseStatusCode == 200) {
        NSString *responseString = [request responseString];
//        NSDictionary *responseDict = [responseString xml];
//        NSString *unlockCode = [responseDict objectForKey:@"unlock_code"];
        
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
 
    NSLog(@"%@",request);
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
