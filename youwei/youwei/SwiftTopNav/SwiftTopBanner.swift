//
//  SwiftTopBanner.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit


class SwiftTopBanner: UIView {
 /**顶部视图TopView**/
    @IBOutlet weak var hight: NSLayoutConstraint!
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var btnGoback: UIButton!
    
    @IBOutlet weak var lalTitel: UILabel!
    
    var parentController:UINavigationController!
    
    
    class UIBackButton:UIButton {
        
        
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
