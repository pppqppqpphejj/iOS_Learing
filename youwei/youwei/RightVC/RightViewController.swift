//
//  RightViewController.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    @IBOutlet weak var _VTop: SwiftTopBanner!
    @IBOutlet weak var btnToSwiftDelegaet: UIButton!

    @IBAction func ppp(sender: AnyObject) {
        
            self._VTop.btnGobackAction(sender as! UIButton)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
          super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self._VTop.btnGoback.hidden = false
        self._VTop.btnGoback.backgroundColor = UIColor.blueColor()
        self._VTop.parentController = self.navigationController
        self._VTop.lalTitel.text = "右返回"

        var  sTTudent = SwiftStringA.sharedInstance.readWithNSKeyedUnarchiver("student.archive", documentsPath: SwiftStringA.sharedInstance.swStringDocumentsPath()) as! SwiftStudent
        
        
        print("textName \(sTTudent.textName)")
        print("textPhone \(sTTudent.textPhone)")
        
        
        self.btnToSwiftDelegaet.addTarget(self, action: "btnToSwiftDelegaet:", forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }
    func btnToSwiftDelegaet(btnToSwiftDelegaet:UIButton)
    {
        let SwiftDelegaet = SwiftDelegateViewController()
        
        self.navigationController?.pushViewController(SwiftDelegaet, animated: true)
        //        let SwiftDelegaet = SwiftDelegateViewController()
//        
//        SwiftDelegaet.stringV = "实际上睡觉睡觉睡觉"
//        self.presentViewController(SwiftDelegaet, animated: true, completion: nil)
//    
        
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
