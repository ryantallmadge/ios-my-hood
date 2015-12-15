//
//  DataService.swift
//  my-hood
//
//  Created by Ryan Tallmadge on 12/15/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation;
import UIKit;


class DataService {
    
    static let instance = DataService();
    
    let KEY_POSTS = "posts";
    private var _loadedPosts = [PostModel]();
    
    var loadedPosts : [PostModel] {
        return self._loadedPosts;
    }
    
    
    func savePosts(){
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts);
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS);
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func loadPosts(){
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [PostModel] {
                _loadedPosts = postsArray;
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil));
        
    }
    
    func saveImageAndCreatePath(image : UIImage) -> String {
    
        let imageData = UIImagePNGRepresentation(image);
        let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png";
        let fullPath  = documentsPathForFileName(imagePath);
        imageData?.writeToFile(fullPath, atomically: true);
        
        return imagePath;
        
    }
    
    func imageForPath(path : String) -> UIImage? {
        let fullPath = documentsPathForFileName(path);
        let image = UIImage(named: fullPath);
        return image;
    }
    
    func addPost(post : PostModel){
        self._loadedPosts.append(post);
        self.savePosts();
        self.loadPosts();
    }
    
    
    func documentsPathForFileName(name : String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true);
        let fullPath = paths[0] as NSString;
        return fullPath.stringByAppendingPathComponent(name);
    }
    
    
}
