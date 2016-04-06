//
//  RightViewCell.swift
//  youwei
//
//  Created by 邵瑞 on 16/4/6.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

import UIKit

class RightViewCell: UITableViewCell {

    
    @IBOutlet weak var labName: UILabel!
    
    @IBOutlet weak var labDec: UILabel!
     /**赋值**/
    func setTextlabName(name:NSString!,dec:NSString!)
    
    {
        
        self.labName.text? = "是生生世世\(name)" as String
        self.labDec.text? = "生生世世身体\(dec)" as String
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
