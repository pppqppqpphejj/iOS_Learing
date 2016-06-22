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
/***传入控制器***/
    var conteroller:UIViewController!
    
    @IBOutlet weak var labTitle: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    // MARK: - Initializer
    override private init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    // MARK: - NSCoding
    required internal init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        awakeFromNib()
    }
     func loadNibFrame() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        
        //nibName是你定义的xib文件名
        let nib = UINib(nibName: "HeaderTabView", bundle: bundle)
        

        return nib.instantiateWithOwner(self, options: nil)[0] as! UIView

    }
//    事件初始化
    override func awakeFromNib() {
        
        self.btnAction.removeTarget(self, action: "NULL", forControlEvents: UIControlEvents.TouchUpInside)
        self.btnAction.addTarget(self, action: "btnTouch:" , forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    /***自定义的点击事件***/
    
    func btnTouch(touchSingle:UIButton!)
    {
    
        var MySchoolV:MySchoolViewController!
        MySchoolV =  MySchoolViewController(nibName: "MySchoolViewController" as String, bundle: nil)
        self.conteroller.presentViewController(MySchoolV, animated: true) { () -> Void in
            
        }
    }

    
    
    /***输出口事件***/
    @IBAction func btnTouchA(sender: AnyObject) {
        
        
        
        var MySchoolV:MySchoolViewController!
        MySchoolV =  MySchoolViewController(nibName: "MySchoolViewController" as String, bundle: nil)
        
        
        
        
        self.conteroller.presentViewController(MySchoolV, animated: true) { () -> Void in
            
        }

        
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
