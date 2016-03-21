//
//  RootViewController.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var _VTop: SwiftTopBanner!
 
    @IBAction func btnToPush(sender: AnyObject) {
   
        openLeft()

    }
    
    @IBOutlet weak var modePop: UIButton!
    @IBAction func modelPop(sender: AnyObject) {
        
        
        //        let  right
        let tow_vc = NextViewController();
        
        self.navigationController?.pushViewController(tow_vc, animated: true)
        
        
//        self.presentViewController(tow_vc, animated: true, completion: nil)
        

    }
    @IBAction func btnRightPushAction(sender: AnyObject) {
        
        //        let  right
        let tow_vc = RightViewController();
        
        self.presentViewController(tow_vc, animated: true, completion: nil)
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self._VTop.btnGoback.hidden = true
        self._VTop.lalTitel.text = NSString(string: "自定义") as String
        
        
        
        var things = "cars"
        let  clouser =
        {
            [things] in
            
        print("i love \(things)")

        }
        things = "ssss"
        clouser()

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
