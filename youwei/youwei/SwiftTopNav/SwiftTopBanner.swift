//
//  SwiftTopBanner.swift
//  youwei
//
//  Created by 邵瑞 on 16/3/18.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit
class UIBackButton:UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)

        fatalError("init(coder:) has not been implemented")
    }
    
 override func awakeFromNib()
    
    {

        self.imageView?.image = UIImage(named: "白色返回箭头")
        backgroundColor =  UIColor.brownColor()
        showsTouchWhenHighlighted = true
    }
    
    override func layoutSubviews() {
        imageView?.frame =  CGRectMake(11.0, 12.0, 12.0, 22.0)
    }
    

}


class SwiftTopBanner: UIView{
    
 /**顶部视图TopView**/
    @IBOutlet weak var hight: NSLayoutConstraint!
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var btnGoback: UIButton!
    
    @IBOutlet weak var lalTitel: UILabel!
    
    var parentController:UINavigationController!
     /**获取自定义的XIB**/
    var nibArray:NSArray!
    /**添加约束**/
    var  dicViews:NSDictionary!
    var  appPop:AppDelegate!
    var  windowPop:UIWindow!
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    func setframe(frame:CGRect)
    {

        
        super.frame = frame
        self.view.frame = frame;
        
    }
    
    override func awakeFromNib()
    {
        

        self.parentController = nil

        nibArray = (NSBundle.mainBundle().loadNibNamed("SwiftTopBanner", owner: self, options: nil))
        
        self.view = self.nibArray.objectAtIndex(0) as! UIView
        self.view.translatesAutoresizingMaskIntoConstraints =  false
        self.addSubview(self.view)
        

        self.dicViews = ["view":self.view]
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|", options:NSLayoutFormatOptions.DirectionMask, metrics: nil, views: self.dicViews as! [String : AnyObject]))

        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views:self.dicViews as! [String : AnyObject]))
        
        self.btnGoback.backgroundColor = UIColor.clearColor()
        self.btnGoback.removeTarget(self, action: Selector(), forControlEvents: UIControlEvents.TouchUpInside)
        self.btnGoback.addTarget(self, action: "btnGobackAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }
    //MARK: - button event
    
     func btnGobackAction(btnGobackAction:UIButton)
    {
    
        /**获得根视图并取得UINavigationController地址**/

        appPop = UIApplication.sharedApplication().delegate as! AppDelegate
        
        self.parentController = appPop.nav
         /**会自行选择pop 还是 model**/
        parentController.popViewControllerAnimated(true)
        /**会自行选择pop 还是 model**/

        parentController.dismissViewControllerAnimated(true, completion: nil)
        print("self.parentController \(self.parentController)")

    }

    
    
}
