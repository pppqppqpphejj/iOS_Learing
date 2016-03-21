//
//  ExSlideMenuController.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class ExSlideMenuController: SlideMenuController {


    override func isTagetViewController() -> Bool {
        var tagetVC:Bool!

      if let vc = UIApplication.topViewController(){
                
               if vc is RootViewController ||
                  vc is LeftViewController ||
                  vc is RightViewController
                {
                    tagetVC = true
                    return tagetVC
                }
                else
                    {
                        tagetVC = false
                    }
        }
        return tagetVC;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
