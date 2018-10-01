//
//  SplitWindowViewController.swift
//  Assignment2
//
//  Created by Megan Hayes on 9/30/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

class SplitWindowViewController: NSWindowController {
    
    convenience init(){
        self.init(windowNibName: NSNib.Name(rawValue: "aboutPageController"));
        
    }
    
    @IBAction func searchBar(_ sender: NSSearchFieldCell) {
        let fileCollection: Collection = Collection();
        let file: [MMFile] = fileCollection.search(term: sender.stringValue)
        //display file in another
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

//    override func windowDidLoad() {
//        super.windowDidLoad()
//
//        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
//    }

}

