//
//  AddPostViewController.swift
//  my-hood
//
//  Created by Ryan Tallmadge on 12/14/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postImage  : CircleImageView!
    @IBOutlet weak var titleLabel : UITextField!
    @IBOutlet weak var descLabel  : UITextField!
    
    var imagePicker : UIImagePickerController!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
    }

    @IBAction func addPicButtonPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal);
        presentViewController(imagePicker, animated: true, completion: nil);
    }
    
    @IBAction func canceledButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func makePostButtonPressed(sender: AnyObject) {
        
        if let title = titleLabel.text, let desc = descLabel.text, let img = postImage.image {
            let imagePath = DataService.instance.saveImageAndCreatePath(img);
            let post = PostModel(imagePath: imagePath, title: title, description: desc);
            DataService.instance.addPost(post);
            dismissViewControllerAnimated(true, completion: nil);
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil);
        postImage.image = image;
    }
    
    
}
