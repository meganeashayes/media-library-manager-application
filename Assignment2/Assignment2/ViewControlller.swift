//
//  ViewControlller.swift
//  Assignment2
//
//  Created by Sweta Kumari on 9/27/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

class ViewControlller: NSViewController {
    
    //@IBOutlet weak var tableView: NSTableView!
    //@IBOutlet weak var tableContent: NSScrollView!

    //override the viewDidLoad to show superview as soon as the view loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // To override the object whose value is presented in the receiver’s primary view.
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
}
