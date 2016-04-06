//
//  SwiftDelegateViewController.swift
//  youwei
//
//  Created by 邵瑞 on 16/4/1.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit
//相应协议
class SwiftDelegateViewController: UIViewController,ParamsProtocol {
    
    var stringV = NSString()
    var rootDelegate = RootViewController()
    
    
    @IBOutlet weak var V_Top: SwiftTopBanner!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print("传入的值是\(self.stringV)")
//        self.V_Top.parentController = self.navigationController
        self.V_Top.lalTitel.text = "sss"
        self.V_Top.btnGoback.hidden  = false
         /**设置代理**/
        rootDelegate.paramsProtocolDelegate = self
//        调用函数 触发代理事件
        rootDelegate.delegateStart()

        // Do any additional setup after loading the view.
    }

    
    func returnParams(tmpStr: String) {
        
        print("传入 Swift \(tmpStr)")
    }
    
    func returmParameArray(array: NSArray!) {
        print("传入 NSArray Swift \(array)")

    }
    
    func returmParameDic(array: NSDictionary!) {
        print("传入NSDictionary  Swift \(array)")

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
