//
//  SwiftNSArray.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/29.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class SwiftNSArray: NSObject {

    
    /**swift NSArray 单列**/
    static var sharedInstance:SwiftNSArray
    {
        struct Static {
            static let instance : SwiftNSArray = SwiftNSArray()
            
        }
        return Static.instance
    }
    

}
