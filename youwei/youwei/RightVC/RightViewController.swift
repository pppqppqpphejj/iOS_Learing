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

    @IBAction func ppp(sender: AnyObject) {
        
            self._VTop.btnGobackAction(sender as! UIButton)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self._VTop.btnGoback.hidden = false
        self._VTop.lalTitel.text = "右返回"

        var  sTTudent = SwiftStringA.sharedInstance.readWithNSKeyedUnarchiver("student.archive", documentsPath: SwiftStringA.sharedInstance.swStringDocumentsPath()) as! SwiftStudent
        
        
        print("textName \(sTTudent.textName)")
        print("textPhone \(sTTudent.textPhone)")
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
