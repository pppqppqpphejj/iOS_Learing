//
//  RightViewController.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class RightViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    
    
    @IBOutlet weak var _VTop: SwiftTopBanner!
    @IBOutlet weak var btnToSwiftDelegaet: UIButton!

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: cell 标识符
    let CellIdentifierNib = "RightViewCell"
    let CellIdentifierClass = "class"
    let CellIdentifierStoryboard = "Storyboard"
    let CellIdentifierdSystem = "System"
//    数据源
    var products:NSArray!
    
    @IBAction func ppp(sender: AnyObject) {
        
            self._VTop.btnGobackAction(sender as! UIButton)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
          super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self._VTop.btnGoback.hidden = false
        self._VTop.btnGoback.backgroundColor = UIColor.blueColor()
        self._VTop.parentController = self.navigationController
        self._VTop.lalTitel.text = "右返回"

        
//        初始化 tableView
        initTableView()
        
        
//        var  sTTudent = SwiftStringA.sharedInstance.readWithNSKeyedUnarchiver("student.archive", documentsPath: SwiftStringA.sharedInstance.swStringDocumentsPath()) as! SwiftStudent
        
//        
//        print("textName \(sTTudent.textName)")
//        print("textPhone \(sTTudent.textPhone)")
        
        
//        self.btnToSwiftDelegaet.addTarget(self, action: "btnToSwiftDelegaet:", forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }
    func btnToSwiftDelegaet(btnToSwiftDelegaet:UIButton)
    {
        let SwiftDelegaet = SwiftDelegateViewController()
        
        self.navigationController?.pushViewController(SwiftDelegaet, animated: true)
        //        let SwiftDelegaet = SwiftDelegateViewController()
//        
//        SwiftDelegaet.stringV = "实际上睡觉睡觉睡觉"
//        self.presentViewController(SwiftDelegaet, animated: true, completion: nil)
//    
        
    }
    
    
    func initTableView()
    {
//        直接赋值创建字典
        var myDic1:Dictionary<String,String>
//        清空 myDic1 = [:]
//        存入类型<String,String>
        var myDic2:Dictionary<String,String>
        var myDic3:Dictionary<String,String>
        var myDic4:Dictionary<String,String>
        var myDic5:Dictionary<String,String>

        //使用init()构造器
//        var myDicOne:[String:Float] = Dictionary<String,Float>()
        
        myDic1 =  ["name":"A boat for one person", "dec":"275.0"]
        myDic2 =  ["name":"Protective and fashionable", "dec":"48.95"]
        myDic3 =  ["name":"Protective and fashionable", "dec": "48.9"]
        myDic4 =  ["name":"Give your playing field a professional touch","dec":"q1001"]
        myDic5 =  [ "name": "Improve your brain efficiency by 75%", "dec":"16.8"]

        self.products = [myDic1,myDic2,myDic3,myDic4,myDic5]

        
        // Nib 注册
        self.tableView.registerNib(UINib(nibName: "RightViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifierNib)
//        let cell = tableView.dequeueReusableCellWithIdentifier("RightViewCell")
        //            as! RightViewCell; //cellForRowAtIndexPath
//        self.tableView.registerClass(RightViewCell.self, forCellReuseIdentifier: "RightViewCell")

        
        // Class 注册
//        self.tableView!.registerCellClass(RightViewCell.self, forCellReuseIdentifier: "RightViewCell")
        //        self.tableView.registerClass(RightViewCell.classForCoder(), forCellReuseIdentifier: "RightViewCell")

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        

        self.tableView.reloadData()
       
    
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.products.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

//        let cell = tableView.dequeueReusableCellWithIdentifier("RightViewCell")  as! RightViewCell;

        let cell = tableView.dequeueReusableCellWithIdentifier("RightViewCell")
            as! RightViewCell;
//        let cell = self.tableView.dequeueReusableCellWithIdentifier("RightViewCell", forIndexPath: indexPath)
//    as! RightViewCell
     

//        let cell = tableView.dequeueReusableCellWithIdentifier("RightViewCell", forIndexPath: indexPath) as! RightViewCell
        let  productCell = products[indexPath.row]
     let ss = productCell.objectForKey("name") as! NSString
        let ssdec = productCell.objectForKey("dec") as! NSString

        cell.setTextlabName(ss , dec: ssdec)
//        cell.labDec.text = ssdec
//        cell.labName.text = ss
        return cell;
        
    }
    

    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let  productCell = products[indexPath.row]
        
        self.navigationController?.popViewControllerAnimated(true)

        print("productCell \(productCell)")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
//        
//
//    } 
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
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
