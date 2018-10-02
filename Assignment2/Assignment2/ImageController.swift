//
//  ImageController.swift
//  Assignment2
//
//  Created by Megan Hayes on 9/30/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

class ImageController: NSWindowController {
    
    @IBOutlet weak var mediaNotes: NSTextField!
    
    convenience init(){
        self.init(windowNibName: NSNib.Name(rawValue: "imageController"));
        
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
