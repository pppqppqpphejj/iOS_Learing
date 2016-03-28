//
//  SwiftString.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/28.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit
import Foundation
class SwiftString: UIView {

 /**swift 单列**/
    static var sharedInstance:SwiftString
        {
            struct Static {
                static let instance : SwiftString = SwiftString()

            }
          return Static.instance
    }
    
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
