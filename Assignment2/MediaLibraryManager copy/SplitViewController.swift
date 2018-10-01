//
//  SplitViewController.swift
//  Assignment2
//
//  Created by Megan Hayes on 9/30/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    override func splitView(_ splitView: NSSplitView, shouldCollapseSubview: NSView, forDoubleClickOnDividerAt: Int) -> Bool {
        return true;
    }
    
}
