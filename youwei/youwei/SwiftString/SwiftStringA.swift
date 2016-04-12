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
     * split 分割
     **/
    func swStringSplitCharacterOccurrencesOfString(stringA:String,objString:String)-> NSArray
    {
        var array:NSArray!
        
        if objString.isEmpty
        {
            
            array = [stringA]
            return array
        }
        else
        {
            array = objString.componentsSeparatedByString(stringA)

        }
        
        return array
        
    }
    /**
     *使用NSUserDefaults存储数据
     *@prarm object 储存对象
     *@prarm key 取对象的key
     * return isNO  储存成功true 反之 false
     **/
    
    func saveWithNSUserDefaults(object:String,key:String)->Bool
    {
        let defaults =  NSUserDefaults.standardUserDefaults();
            defaults.setObject(object, forKey: key)
        var isNO:Bool!
            isNO =  defaults.synchronize()
        
        return isNO
    }
    
    /**
     *使用NSUserDefaults取数据
     *@prarm key 取对象的key
     * return string  取出来字符串
     **/
    
    func readWithNSUserDefaults(key:String)->String
    {
        let defaults =  NSUserDefaults.standardUserDefaults();
        defaults.valueForKey(key)
        var string:String!
        string = defaults.objectForKey(key) as! String
        return string
    }
    
    

    /**
    * 获取应用程序沙盒的Documents目录
    *@prarm 获取沙盒路径后再APPEND配置文件
    *@prarm <#@prarm one#>
    * return 应用程序沙盒的Documents目录
    **/
    func swStringDocumentsPath()->NSString
    {
        var path:NSString!
        let arrPathDocm:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsPath = arrPathDocm.first as! String
//        path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String

        path = documentsPath
       return  path
    }
    
    
    /**
     *@prarm type
     *@prarm fileName
     * return path 文件bundel路径
     **/
    func getFilePath(fileName:String,type:String) ->String {
        //        return NSBundle.mainBundle().pathForResource("Checklist", ofType: "plist")!

        var path:String!
        path = NSBundle.mainBundle().pathForResource(fileName, ofType: type)
        return path
    }
    /**
     
     *@prarm 读取本地文件
     *@prarm fileName 文件名称
     * return 返回dic
     **/
    
    func swWriteFileData(fileName:String,typeName:String)->NSDictionary
    {
        var dic:NSDictionary!
        
        
        
        
        
        return dic
    
    
    }
    
    
    /**
    *归档数据/需要实现NSCoding协议
    * 归档 saveWithNSKeyedArchiver
    *@prarm pathfile 文件名称 arichive
    *@prarm <#@prarm one#>
    * return <#Return Type Values#>
    **/
    
    func saveWithNSKeyedArchiver(anOject:AnyObject,filePath:String)->Bool
    {
        var isNO:Bool!

//        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString

        let docPath = swStringDocumentsPath().stringByAppendingPathComponent(filePath)
//
        isNO = NSKeyedArchiver.archiveRootObject(anOject, toFile: docPath);

        return isNO
        
        }
    /**
     *归档数据/需要实现NSCoding协议
     * 归档 saveWithNSKeyedArchiver
     *@prarm pathfile 文件名称 arichive
     *@prarm documentsPath 读取储存的路径
     * return
     **/
    func readWithNSKeyedUnarchiver(filePath:NSString ,documentsPath:NSString )->AnyObject {
    
        var anOject:SwiftStudent!;
        let  docPath = documentsPath.stringByAppendingPathComponent(filePath as String)
        
        var blHave:Bool = NSFileManager.defaultManager().fileExistsAtPath(docPath);

        if (blHave)
        {
    
            
            anOject =  NSKeyedUnarchiver.unarchiveObjectWithFile(docPath) as! SwiftStudent
            
            
            return  anOject
        }
        
        else
        {
            return ""
        }
       
        
    }
    /**
     *@prarm 移除已储存的数据
     *@prarm 传入储存文件路径
     * return 返回bool 值
     **/
        func removeFilePathFromDocumentsPath(filePath: String!)->Bool{
        


        let docPath = swStringDocumentsPath().stringByAppendingPathComponent(filePath)

        var blHave:Bool = NSFileManager.defaultManager().fileExistsAtPath(docPath)
        if(blHave)
        {
        
        do {
            try NSFileManager.defaultManager().removeItemAtPath(docPath)
            
            
             blHave = NSFileManager.defaultManager().isDeletableFileAtPath(docPath)
            
            return  blHave
        }
        catch {
            
            return blHave
            
        }
            
        }
       return blHave
    }
    
    
    func readTextString(textString: NSString!)->NSString
    {
        
        
//        var str:NSString = NSString.stringWithContentsOfFile(_srcouceFilePath,encoding:NSUTF8StringEncoding,error:nil)

        var textString = NSString()
        var encode:NSStringEncoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
//        textString = NSString.stringWithContentsOfFile(textString,encoding:encode,error:nil)
        
        return textString
    }
    
    
    
    
    
}
