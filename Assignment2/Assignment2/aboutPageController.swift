//
//  aboutPageController.swift
//  Assignment2
//
//  Created by Sweta on 28/09/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa


// class to implement aboutWindow, which tell some details reagrding the application
class aboutPageController: NSWindowController {
    
    // Outlet to the View to displays the about window
    @IBOutlet weak var aboutWindow: NSView!
    // Outlet to the textfield to displays content of textfield
    @IBOutlet weak var aboutWindowText: NSTextField!
    
    // MARK: - convenience initializer
    convenience init(){
        self.init(windowNibName: NSNib.Name(rawValue: "aboutPageController"));
        
    }
    
     // Function to override on window load, displays some information about the application
    override func windowDidLoad() {
        super.windowDidLoad()
        // Set features to display in the window to give some information about the application
        aboutWindow.window?.setTitleWithRepresentedFilename("About")
        aboutWindowText.stringValue = "An application to manage a media collection.\n Developed by Sweta Kumari and Megan Hayes\nCreated for the University of Otago COSC346 Assignment 2"
    }
    
}
