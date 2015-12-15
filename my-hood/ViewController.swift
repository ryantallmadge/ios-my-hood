//
//  ViewController.swift
//  my-hood
//
//  Created by Ryan Tallmadge on 12/14/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PostModel]();
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row];
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostTableViewCell") as? PostTableViewCell {
            cell.configCell(post);
            return cell;
        }else {
            let cell = PostTableViewCell();
            cell.configCell(post);
            return cell;
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate   = self;
        tableView.dataSource = self;
        DataService.instance.loadPosts();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil);
    }

    func onPostsLoaded(notify : AnyObject){
        tableView.reloadData();
    }


}

