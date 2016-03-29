//
//  RootViewController.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//


import UIKit
import JavaScriptCore

class RootViewController: UIViewController
{
    

    
    
    var jsonDic:NSDictionary!
     /**单列初始化**/

    @IBOutlet weak var _VTop: SwiftTopBanner!
 
    @IBAction func btnToPush(sender: AnyObject) {
   
        openLeft()

    }

    
    @IBOutlet weak var modePop: UIButton!
    @IBAction func modelPop(sender: AnyObject) {
        
        var arr = ["1067349543@qq.com","13983441921@139.com"] as Array
        var isNO:Bool!
        isNO =  SwiftSingle.sharedInstance.messageSend(arr, messageContent: "nihao 你好！", ViewController: self)
        print("\(isNO )")
        
         /**拨打电话**/
//        SwiftSingle.sharedInstance.messageSend()
//        SwiftSingle.sharedInstance.callPhoneNumberAction("13983441921")

    }
    @IBAction func btnRightPushAction(sender: AnyObject) {
        
        //        let  right
        let tow_vc = RightViewController();
        
        self.presentViewController(tow_vc, animated: true, completion: nil)
        
        

    }
    //MARK:viewDidLoad
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        var strEmpty:NSString!

        strEmpty = "ee"

        var isNO:Bool!
        
//        var text:NSString = NSString(CString:strEmpty .cStringUsingEncoding(NSUTF8StringEncoding),
//            encoding: NSUTF8StringEncoding)
        isNO = SwiftStringA.sharedInstance.isEmptyString(strEmpty as String)
        
        
        
        print("是否为空\(isNO)")
        
        
        isNO = SwiftStringA.sharedInstance.isStringAEqualStringB(NSString(string: "ABC"), stringB: NSString(string: "ABC"))
        
        var strSub:NSString!
        
        strSub = SwiftStringA.sharedInstance.subFromToIndex(3, objcString: "ABCDFRRw" )

        print("截取之后的字符串 \(strSub)")


        strSub = SwiftStringA.sharedInstance.subStringFromZeroToIndex(5, objcString: "ABCDFRRw" )
        
        print("截取之后的字符串 \(strSub)")

        strSub = SwiftStringA.sharedInstance.subsStringFromWithRange(2, indexB: 6, objcString: "ssqwioiow")
        
        print("截取之2-6 后的字符串 \(strSub)")

        
        strSub = SwiftStringA.sharedInstance.swStringByReplacingOccurrencesOfString("?", stringB: "+", objString: "http://www.comcom.com?type=22&userme=ooo")
        
        print("替换之 后的字符串 \(strSub)")
        strSub = SwiftStringA.sharedInstance.swStringFilterReplacingOccurrencesOfString("?", objString: "http://www.comcom.com?type=22&userme=ooo")
        
        print("过滤之 后的字符串 \(strSub)")


        
        strSub = SwiftStringA.sharedInstance.swStringFilterWhitespaceCharacterOccurrencesOfString(" http:www.com  ")
        
        print("过滤开始 结尾的空白之 后的字符串 \(strSub)")

        print("是否为空\(isNO)")


        print("打印常量字符串\n\(SwiftStringA.sharedInstance.constString)")
        
        var isBool = SwiftStringA.sharedInstance
        
        self._VTop.btnGoback.hidden = true
        self._VTop.lalTitel.text = NSString(string: "自定义") as String
        self.jsonDic = ["key":"sss"]
        print("is json dic \(self.jsonDic)")
        print("is json dic  objectForKey \(self.jsonDic.objectForKey("key"))")

        
        
        var things = "cars"
        let  clouser =
        {
            [things] in
            
        print("i love \(things)")

        }
        things = "ssss"
        clouser()
        
        
        requestUrl("https://www.baidu.com")

        // Do any additional setup after loading the view.
    }
    
//    MARK: swift 网络请求
     func requestUrl(urlString:String)
    {
    
        var url:NSURL!
        
        url = NSURL(string: urlString)! as NSURL
        
        NSLog("打印urlstrinh==%@", "\(url)")
        
        let request:NSURLRequest = NSURLRequest(URL: url)
 
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
                  }
        
    }
    
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
