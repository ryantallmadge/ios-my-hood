//
//  PostTableViewCell.swift
//  my-hood
//
//  Created by Ryan Tallmadge on 12/14/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImg : CircleImageView!;
    @IBOutlet weak var title   : UILabel!;
    @IBOutlet weak var post    : UILabel!;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(postData : PostModel){
        title.text = postData.title;
        post.text  = postData.postDesc;
        postImg.image = DataService.instance.imageForPath(postData.imagePath);
    }

}
