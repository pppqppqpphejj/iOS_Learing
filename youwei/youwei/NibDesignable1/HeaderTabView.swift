//
//  HeaderTabView.swift
//  youwei
//
//  Created by 邵瑞 on 16/6/20.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class HeaderTabView: NibDesignable {

    @IBOutlet var headView: UIView!
    
     func loadNibFrame() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        
        //nibName是你定义的xib文件名
        let nib = UINib(nibName: "HeaderTabView", bundle: bundle)
        
        return nib.instantiateWithOwner(self, options: nil)[0] as! UIView

    }
    

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
