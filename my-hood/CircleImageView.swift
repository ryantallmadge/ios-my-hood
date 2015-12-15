//
//  CircleImageView.swift
//  my-hood
//
//  Created by Ryan Tallmadge on 12/14/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.layer.borderWidth  = 2.0
        self.layer.borderColor  = UIColor.blackColor().CGColor
        self.clipsToBounds      = true;
    }
    
    
}
