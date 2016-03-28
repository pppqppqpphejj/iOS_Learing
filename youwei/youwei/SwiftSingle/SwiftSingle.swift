//
//  SwiftSingle.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/28.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

import Foundation
import MessageUI
class SingleOne {
    
    //单例
    static let shareSingleOne = SingleOne()
    
    func callPhoneNumberAction(phoneString:NSString)
    {
        var url1 = NSURL(string: "tel://"+"\(phoneString)")
        
        print("打印电话phoneString :\(phoneString)")
        print("打印电话 url1 :\(url1)")
        
        UIApplication.sharedApplication().openURL(url1!)
        
        
        
    }
    
    
    
}
class SingleTwo {
    
    //单例
    class func shareSingleTwo()->SingleTwo{
        struct Singleton{
            static var onceToken : dispatch_once_t = 0
            static var single:SingleTwo?
        }
        dispatch_once(&Singleton.onceToken,{
            Singleton.single=shareSingleTwo()
            }
        )
        return Singleton.single!
    }
    
    func callPhoneNumberAction(phoneString:NSString)
    {
        var url1 = NSURL(string: "tel://"+"\(phoneString)")
        
        
//                var url1 = NSURL(string: "tel://10086")
        
        print("打印电话phoneString :\(phoneString)")
        print("打印电话 url1 :\(url1)")

        UIApplication.sharedApplication().openURL(url1!)
        
        
        
    }
    
}
//    //全局的常量
//    let swfitSingle = SingleThree()
//
//    class SingleThree {
//
//        class var sharedInstance : SingleThree {
//            return swfitSingle
//        }
//    }
class SingleFour {
    
    static var sharedInstance : SingleFour {
        struct Static {
            static let instance : SingleFour = SingleFour()
        }
        return Static.instance
    }
    
    /**
    *@prarm phoneString 电话号码
    *@prarm <#@prarm one#>
    * return <#Return Type Values#>
    **/
    func callPhoneNumberAction(phoneString:NSString)
    {
        var urlTell:NSURL!
        
        urlTell = NSURL(string: "tel://"+"\(phoneString)")
        print("打印电话phoneString :\(phoneString)")
        print("打印电话 url1 :\(urlTell)")
        UIApplication.sharedApplication().openURL(urlTell!)
        
        
        
    }
}



class SwiftSingle: NSObject ,MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate{
    
    
     /**Swift 单列**/
    static var sharedInstance : SwiftSingle {
        struct Static {
            static let instance : SwiftSingle = SwiftSingle()
        }
        return Static.instance
    }
    
    /**
     *@prarm phoneString 电话号码
     *@prarm <#@prarm one#>
     * return <#Return Type Values#>
     **/
    func callPhoneNumberAction(phoneString:NSString)
    {
        var urlTell:NSURL!
        
        urlTell = NSURL(string: "tel://"+"\(phoneString)")
        print("打印电话phoneString :\(phoneString)")
        print("打印电话 url1 :\(urlTell)")
        UIApplication.sharedApplication().openURL(urlTell!)
        
        
        
    }

    /**
     *@prarm arryPerson 联系人
     *@prarm messageContent 发送内容
     *@prarm ViewController 进入短信控制器
     * return bool
     **/
    func messageSend(arryPerson:NSArray , messageContent:NSString ,ViewController:UIViewController)->Bool
    {
        /**判断是否可以发送**/

        var boolNo:Bool!

        //首先要判断设备具不具备发送短信功能
        if MFMessageComposeViewController.canSendText(){
            let controller = MFMessageComposeViewController()
            //设置短信内容
            controller.body = messageContent as String
            //设置收件人列表
            controller.recipients = arryPerson as? [String]
            controller.messageComposeDelegate = self
            //打开界面
            ViewController.presentViewController(controller, animated: true, completion: { () -> Void in
                
            })

            
        }else{
            
            boolNo = false
            print("本设备不能发送短信")
        }


        return boolNo
        
        
    }
    
    
    //发送短信代理
    func messageComposeViewController(controller: MFMessageComposeViewController!,
        didFinishWithResult result: MessageComposeResult) {
            controller.dismissViewControllerAnimated(true, completion: nil)
            switch (result) {
            case MessageComposeResultCancelled:
                NSLog("Cancelled");
                
                break;
            case MessageComposeResultFailed:
                NSLog("unknown error sending m");
                break;
            case MessageComposeResultSent:
                NSLog("Message sent successfully");
                
                break;
            default:
                break;
            }
    }

    

    
    
}
