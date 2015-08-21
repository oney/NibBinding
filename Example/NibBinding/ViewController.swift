//
//  ViewController.swift
//  NibBinding
//
//  Created by Howard Yang on 08/20/2015.
//  Copyright (c) 2015 Howard Yang. All rights reserved.
//

import UIKit
import NibBinding

class ViewController: UIViewController {

    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var animateButton: UIButton!
    var photoTopLayoutConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPhoto() {
        var photo = UIImageView(image: UIImage(named: "san-francisco-golden.jpg"))
        
        var constraints = NibBinding.bind("PhotoTemplate", views: [100: self.view, 101: photo])
        photoTopLayoutConstraint = constraints[1001]
        
        addPhotoButton.hidden = true
        animateButton.hidden = false
    }
    
    @IBAction func animate() {
        photoTopLayoutConstraint?.constant += 30
        view.setNeedsUpdateConstraints()
        UIView.animateWithDuration(0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }

}

