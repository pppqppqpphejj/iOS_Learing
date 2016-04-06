//
//  LeftViewController.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    @IBOutlet weak var _VTop: SwiftTopBanner!

    @IBAction func btnPopAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
   
        super.viewDidLoad()

        self._VTop.lalTitel.text = NSString(string: "自定义点点滴滴") as String
          self._VTop.btnGoback.backgroundColor = UIColor.clearColor()
        self._VTop.btnGoback.removeTarget(self, action: Selector(), forControlEvents: UIControlEvents.TouchUpInside)
        self._VTop.btnGoback.addTarget(self, action: "btnRemoveAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
//        var  sTTudent = SwiftStringA.sharedInstance.readWithNSKeyedUnarchiver("student.archive", documentsPath: SwiftStringA.sharedInstance.swStringDocumentsPath()) as! SwiftStudent
        
//        
//        print("textName \(sTTudent.textName)")
//        print("textPhone \(sTTudent.textPhone)")
//        

        // Do any additional setup after loading the view.
    }
  
    func btnRemoveAction(btnRemoveAction:UIButton)
    {
        closeLeft()
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
