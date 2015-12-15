//
//  Post.swift
//  my-hood
//
//  Created by Ryan Tallmadge on 12/14/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation

class PostModel: NSObject, NSCoding {
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init();
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String;
        self._title     = aDecoder.decodeObjectForKey("title") as? String;
        self._postDesc  = aDecoder.decodeObjectForKey("postDesc") as? String;
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath");
        aCoder.encodeObject(self._title, forKey: "title");
        aCoder.encodeObject(self._postDesc, forKey: "postDesc");
    }
    
    private var _imagePath : String!;
    private var _title     : String!;
    private var _postDesc  : String!;
    
    var title : String {
        return _title;
    }
    
    var imagePath : String {
        return _imagePath;
    }
    
    var postDesc : String {
        return _postDesc;
    }
    
    init(imagePath : String, title : String, description : String){
        self._imagePath = imagePath;
        self._title     = title;
        self._postDesc  = description;
    }
    
}