//
//  Detail1ViewController.swift
//  gestureSample
//
//  Created by 栗本幸正 on 2014/11/29.
//  Copyright (c) 2014年 栗本幸正. All rights reserved.
//

import UIKit

class Detail1ViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    func dumpConstraints(view:UIView) {
        if let children = view.subviews as? [UIView] {
            for child in children {
                self.dumpConstraints(child)
            }
        }
        
        NSLog("\(view).constraints = \(view.constraints()) \n\n")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.dumpConstraints(self.view)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

