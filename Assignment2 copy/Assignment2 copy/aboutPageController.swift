//
//  aboutPageController.swift
//  Assignment2
//
//  Created by Sweta on 28/09/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

class aboutPageController: NSWindowController {
    
    convenience init(){
        self.init(windowNibName: NSNib.Name(rawValue: "aboutPageController"));

    }
    
    @IBOutlet weak var aboutWindow: NSView!
    @IBOutlet weak var aboutWindowText: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // about window regarding app
           aboutWindow.window?.setTitleWithRepresentedFilename("About")
                //let aboutSize: NSSize = CGSize(width: 400, height: 450)
                //aboutWindow.window?.setIsVisible(true)
                //aboutWindow.setFrameSize(aboutSize)
              aboutWindowText.stringValue = "This is application to manage media collection.\n Developed by Sweta Kumari and Megan Hayes created for the University of Otago, COSC-346 Assignment2."
    }
    
}
