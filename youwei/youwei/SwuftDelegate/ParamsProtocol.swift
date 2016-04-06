//
//  ParamsProtocol.swift
//  youwei
//
//  Created by 邵瑞 on 16/4/6.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit
import Foundation

public protocol ParamsProtocol {
    
    
    
    
    //协议中得方法不能有结构体
     /**传入一个字符串 ，**/
    
 func returnParams(tmpStr: String)
    
    /**传入一个数组 ，**/

    func returmParameArray(array:NSArray!)
    /**传入一个Dic ，**/

    func returmParameDic(array:NSDictionary!)


    
}
