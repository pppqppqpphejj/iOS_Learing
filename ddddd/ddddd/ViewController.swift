//
//  ViewController.swift
//  ddddd
//
//  Created by 邵瑞 on 16/3/23.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    var json:NSDictionary!
     /**取出得到所有学校值**/
    var array:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
   requestHaveParam(["":""])

//        Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
//            .response { (request, response, data, error) in
//                print(request)
//                print(response)
//                print(error)
//                var testString = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
//
//                print("testString \(testString)")
////                MARK:转换为JSON
//                 //首先判断能不能转换
//            if (!NSJSONSerialization.isValidJSONObject(testString))
//            {
//                print("is not a valid json object")
//                return
//             }
//                
//                
//                //把NSData对象转换回JSON对象
//                let jsonDicObj : AnyObject! = try? NSJSONSerialization
//                    .JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments)
//                print("Json Object:");
//
////                输出 json
//                print("Json Object\n: \(jsonDicObj)")
//                
//                //验证JSON对象可用性
//                
//                
////                let uname : AnyObject = json.objectForKey("uname")!
////                let mobile : AnyObject = json.objectForKey("tel")!.objectForKey("mobile")!
////                print("get Json Object:"); print("uname: \(uname), mobile: \(mobile)")
//
//        }
//        requestHaveParamReturn(["":""])
//        requestHavePostParamReturn(["":""])
        // Do any additional setup after loading the view, typically from a nib.
    }
//MARK:不带参数请求
    func requestNOParam()
    {
        Alamofire.request(.GET, "http://httpbin.org/get")
        
    }
//    MARK:带有擦数的post请求
    func requestHaveParam(json:NSDictionary)
    {
        

        
        
        Alamofire.request(.GET, "http://www.youweijob.com:1580/yct/MobileTerminal/getSchoolData?")
            .response { (request, response, dataa, error) in
                print(request)
                print(response)
                print(error)

                var testString = NSString(data: dataa!, encoding: NSUTF8StringEncoding) as! String
                print("testString \(testString)")
                //                MARK:转换为JSON
                /*
                //首先判断能不能转换
                if (!NSJSONSerialization.isValidJSONObject(testString))
                {
                    print("is not a valid json object")
                    return
                }*/
                
                
                
                //把NSData对象转换回JSON对象
                var jsonDicObj : AnyObject! = try? NSJSONSerialization
                    .JSONObjectWithData(dataa!, options:NSJSONReadingOptions.AllowFragments)
                print("Json Object:");
                
                //                输出 json
                print("Json Object\n: \(jsonDicObj)")
                

                
                if jsonDicObj === nil
                {
                    return ;

                }
                
                self.array = jsonDicObj.objectForKey("object") as! NSArray
                

//                for dicValues in jsonDicObj  as! NSDictionary
//                {
//                    print("object is value\(dicValues)")
//                }
                var dicO:NSDictionary!

                
                for  dicO in self.array  as! NSArray
                {
                 
                    print("object is value\(dicO)")
                   print("dicO is key name :\(dicO.objectForKey("name"))")
                    
                    print("dicO is key name :\(dicO.objectForKey("id"))")

                }
                


        }

    }
//    MARK: get 请求
    func requestHaveParamReturn(json:NSDictionary)
    {
        
//        NSString * strUrl = [NSString stringWithFormat:@"%@method=%@&typeVer=%@",GET_PPOST_PATH_MAIN_182(queryVerConfiguration),@"queryVerConfiguration",@"2"];

        Alamofire.request(.GET, "http://www.youweijob.com:1580/yct/appPerson/queryVerConfiguration?method=\("queryVerConfiguration")&typeVer=\(2)")
            .response { (request, response, data, error) in
                print(request)
                print(response)
                print(error)
                var testString = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String

        print("testString \(testString)")
        
        }
    }

    //    MARK: POST 请求
    func requestHavePostParamReturn(json:NSDictionary)
    {
        
        let params = ["method":"queryVerConfiguration",
                       "typeVer":"\(2)" ] ;
        
        Alamofire.request(.POST, "http://www.youweijob.com:1580/yct/appPerson/queryVerConfiguration?",parameters:params)
            .response { (request, response, data, error) in
                print(request)
                print(response)
                print(error)
                var testString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("\(testString)")
                
        }
    }
    
    
    
/*
    let parameters = [
    "foo": "bar",
    "baz": ["a", 1],
    "qux": [
    "x": 1,
    "y": 2,
    "z": 3
    ]
    ]
    
    Alamofire.request(.POST, "http://httpbin.org/post", parameters: parameters)
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

