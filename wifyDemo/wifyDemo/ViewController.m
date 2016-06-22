//
//  ViewController.m
//  wifyDemo
//
//  Created by 邵瑞 on 16/6/8.
//  Copyright © 2016年 wifyDemo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)openWifyAction:(id)sender {
//    配置调起无线wify
//    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
//    if ([[UIApplication sharedApplication] canOpenURL:url])
//        {
//            [[UIApplication sharedApplication] openURL:url];
//        }
//    
    [self openLocatio:nil];
    
    
}
//定位服务 打开设置
-(void)openLocatio:(id)sender
{
        //定位服务设置界面
    NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
        {
        [[UIApplication sharedApplication] openURL:url];
        }
}
//FaceTime设置界面
-(void)openFaceTiem
{
        //FaceTime设置界面
    NSURL *url = [NSURL URLWithString:@"prefs:root=FACETIME"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
        {
        [[UIApplication sharedApplication] openURL:url];
        }
}

-(void)openMusic:(id)sender
{
        //音乐设置界面
    NSURL *url = [NSURL URLWithString:@"prefs:root=MUSIC"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
        {
        [[UIApplication sharedApplication] openURL:url];
        }
}



-(void)openWallpaper
{
//    墙纸设置界面
    
        //墙纸设置界面
    NSURL *url = [NSURL URLWithString:@"prefs:root=Wallpaper"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
        {
        [[UIApplication sharedApplication] openURL:url];
        }
}

-(void)openBluetooth
{
        //蓝牙设置界面
    NSURL *url = [NSURL URLWithString:@"prefs:root=Bluetooth"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
        {
        [[UIApplication sharedApplication] openURL:url];
        }

}

-(void)openiCloudCASTLE
   {
       //iCloud设置界面
   NSURL *url = [NSURL URLWithString:@"prefs:root=CASTLE"];
   if ([[UIApplication sharedApplication] canOpenURL:url])
       {
       [[UIApplication sharedApplication] openURL:url];
       }

}
//常用的跳转系统设置参数配置

    /*
     About — prefs:root=General&path=About
     
     Accessibility — prefs:root=General&path=ACCESSIBILITY
     
     Airplane Mode On — prefs:root=AIRPLANE_MODE
     
     Auto-Lock — prefs:root=General&path=AUTOLOCK
     
     Brightness — prefs:root=Brightness
     
     Bluetooth — prefs:root=General&path=Bluetooth
     
     Date & Time — prefs:root=General&path=DATE_AND_TIME
     
     FaceTime — prefs:root=FACETIME
     
     General — prefs:root=General
     
     Keyboard — prefs:root=General&path=Keyboard
     
     iCloud — prefs:root=CASTLE
     
     iCloud Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
     
     International — prefs:root=General&path=INTERNATIONAL
     
     Location Services — prefs:root=LOCATION_SERVICES
     
     Music — prefs:root=MUSIC
     
     Music Equalizer — prefs:root=MUSIC&path=EQ
     
     Music Volume Limit — prefs:root=MUSIC&path=VolumeLimit
     
     Network — prefs:root=General&path=Network
     
     Nike + iPod — prefs:root=NIKE_PLUS_IPOD
     
     Notes — prefs:root=NOTES
     
     Notification — prefs:root=NOTIFICATIONS_ID
     
     Phone — prefs:root=Phone
     
     Photos — prefs:root=Photos
     
     Profile — prefs:root=General&path=ManagedConfigurationList
     
     Reset — prefs:root=General&path=Reset
     
     Safari — prefs:root=Safari
     
     Siri — prefs:root=General&path=Assistant
     
     Sounds — prefs:root=Sounds
     
     Software Update — prefs:root=General&path=SOFTWARE_UPDATE_LINK
     
     Store — prefs:root=STORE
     
     Twitter — prefs:root=TWITTER
     
     Usage — prefs:root=General&path=USAGE
     
     VPN — prefs:root=General&path=Network/VPN
     
     Wallpaper — prefs:root=Wallpaper
     
     Wi-Fi — prefs:root=WIFI
     */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
