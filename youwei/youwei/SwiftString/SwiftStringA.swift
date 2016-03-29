//
//  SwiftStringA.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/29.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class SwiftStringA: NSString {
    
    /**swift 单列**/
    static var sharedInstance:SwiftStringA
    {
        struct Static {
            static let instance : SwiftStringA = SwiftStringA()
            
        }
        return Static.instance
    }
    
     /**打印常量字符串**/
    let constString = "这是一个常量字符串"
     /**声明一个空字符串**/
    
    var isEmptyString = ""
    /**String 声明一个空字符串**/

    var isEmptyStringg = String()

    /**
     *@prarm string 传入一个字符窜
     * return Bool  为空 ture 反之 false
     **/
    func isEmptyString(string:String)->Bool
    {
        var isNO:Bool!
            isNO = false
        
        if string.isEmpty
        {
            isNO = true
        }
        else
        {
            isNO = false
        }
        
        return isNO
    }
    
    /**
     * 判断字符串是否相等
     *@prarm stringA
     *@prarm stringB
     * return isNO 相等 true 反之 false
     **/
    func isStringAEqualStringB(stringA:NSString , stringB:NSString)->Bool
    {
        var isNO:Bool!
        
        
        if stringA.isEqualToString(stringB as String)
        {
            isNO = true
        }
        else
        {
            isNO = false
        }
        
        
        return isNO
    }
    
    /**
     *截取字符串从 index 起
     *@prarm index 第几个开始截取
     *@prarm objcString 传入的字符串
     * return 返回 截取之后的字符串 string
     **/
    func subFromToIndex(index:Int , objcString:NSString)->NSString
    {
        var string:String
        
        string = objcString.substringFromIndex(index)
    
        return string
    }
    

    /**
     *截取字符串截取从 零 到 index
     *@prarm index 第0个开始截取 到 index
     *@prarm objcString 传入的字符串
     * return 返回 截取之后的字符串 string
     **/
    func subStringFromZeroToIndex(index:Int , objcString:NSString)->NSString
    {
        var string:String
        
        string = objcString.substringToIndex(index)
        
        return string
    }
    
    
    /**
     *截取字符串截取从 indexA 到 indexB 之间的字符串
     *@prarm objcString 第indexA个开始截取 到 indexB
     *@prarm objcString 传入的字符串
     * return 返回 截取之后的字符串 string
     **/
    func subsStringFromWithRange(indexA:Int,indexB:Int , objcString:NSString)->NSString
    {
        var string:String
        
        string = objcString.substringWithRange(NSMakeRange(indexA, indexB))
        
        return string
    }
    
    /**
     * 把对象字符串中的字符stringB 替换为stringA／用 stringA 替换 stringB
     *@prarm stringA 被用来替换的字符
     *@prarm stringB  被替换的字符
     *@prarm objcString 传入的字符串
     * return 返回 替换之后的字符串 string
     **/
    func swStringByReplacingOccurrencesOfString(stringA:String,stringB:String ,objString:String)-> NSString
    {
        var string:String!
        
        string = objString.stringByReplacingOccurrencesOfString(stringA, withString: stringB, options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        return string as NSString
        
    }
    
    /**
     * objcString 过滤掉单个字符single string
     *@prarm stringA 用来的字符
     *@prarm objcString 传入的字符串
     * return 返回 替换之后的字符串 string
     * filter 过滤
     **/
    func swStringFilterReplacingOccurrencesOfString(stringA:String ,objString:String)-> NSString
    {
        var string:String!
        
        string = objString.stringByReplacingOccurrencesOfString(stringA, withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        return string as NSString
        
    }

    /**
     * objcString 过滤掉开头和结尾的空白
     * return 返回 替换之后的字符串 string
     * filter 过滤
     **/
    func swStringFilterWhitespaceCharacterOccurrencesOfString(objString:String)-> NSString
    {
        var string:String!
        
        string = objString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return string as NSString
        
    }
    
    /**
     * objcString 过滤掉开头和结尾的空白
     * return 返回 替换之后的字符串 数组
     *
     * split 分割
     **/
    func swStringSplitCharacterOccurrencesOfString(stringA:String,objString:String)-> NSString
    {
        var string:String
        
            var aa = objString.componentsSeparatedByString(stringA)
//        array = split(objString){$0 == "\(stringA)"}
        
        return aa as Array[String]
        
    }
    
}
