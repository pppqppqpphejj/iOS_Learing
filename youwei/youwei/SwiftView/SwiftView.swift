//
//  SwiftView.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/29.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class SwiftView: UIViewController {
    /**swift 单列**/
    static var sharedInstance:SwiftView
    {
        struct Static {
            static let instance : SwiftView = SwiftView()
            
        }
        return Static.instance
    }
    /**实例属性
     都是使用对象调用的
     在类中声明 var 变量名:数据类型?**/
 var titleLabel:UILabel?//实例属性
    
//    懒加载 懒惰属性 lazy 在使用的时候 才去创建
//    懒加载 在创建属性的时候 同时赋值
//    公式：
//    lazy var 变量名:数据类型 = 值
//    
    lazy var list1:NSArray = ["1","2"]
    
    lazy var list:NSArray = NSArray()
    

    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(list1)")
        self.list = ["A","B","C","D"];
        
        print("\(self.list.count)")
        var str:NSString?
//         var str:NSString!
//         var str = NSString()
        for str in self.list
        {
            print("\(str)")
        }
        
        

        // Do any additional setup after loading the view.
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
