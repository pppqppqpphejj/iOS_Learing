//
//  SwiftStudent.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/30.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class SwiftStudent: NSObject,NSCoding {

    
    var textName:NSString!
    var textPhone:NSString!
    var age:Int!
      init(name:NSString,phone:NSString,age:Int) {
        super.init()
           self.textName = name
        self.textPhone = phone
        self.age = age
        
    }

    /*
    override  init() {
    super.init()
    
    }
    
    */

 /**Swift编码**/
    func encodeWithCoder(aCoder: NSCoder) {

        aCoder.encodeObject(self.textName, forKey:"textName")
        aCoder.encodeObject(self.textPhone, forKey:"textPhone")
        aCoder.encodeInteger(self.age, forKey:"age")
        
    }
     /**解码**/
    required init(coder aDecoder: NSCoder) {
        super.init()

     self.textName = aDecoder.decodeObjectForKey("textName") as! NSString
      self.textPhone =  aDecoder.decodeObjectForKey("textPhone") as! NSString
       self.age = aDecoder.decodeIntegerForKey("age")
    }
    
  
}
