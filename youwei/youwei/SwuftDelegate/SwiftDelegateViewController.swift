//
//  SwiftDelegateViewController.swift
//  youwei
//
//  Created by 邵瑞 on 16/4/1.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class SwiftDelegateViewController: UIViewController {
    
    var stringV = NSString()
    
    @IBOutlet weak var V_Top: SwiftTopBanner!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print("传入的值是\(self.stringV)")
//        self.V_Top.parentController = self.navigationController
        self.V_Top.lalTitel.text = "sss"
        self.V_Top.btnGoback.hidden  = false

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
