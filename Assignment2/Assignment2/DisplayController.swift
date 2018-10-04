//
//  DisplayController.swift
//  Assignment2
//
//  Created by Megan Hayes on 10/4/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

class DisplayController: NSWindowController {
    
    var playView = AVPlayer();
    var soundPlayer =  AVAudioPlayer();
    @IBOutlet weak var outletImage: NSImageView!
    @IBOutlet weak var outletVideo: AVPlayerView!
    @IBOutlet weak var outletTextView: NSTextView!
    @IBOutlet weak var outletNotesView: NSTextView!
    
    
    convenience init(){
        self.init(windowNibName: NSNib.Name(rawValue: "DisplayController"));
        
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
//        if index > -1 {
//            imageWindow.window?.setIsVisible(true)
//            let file: File =  mediaFiles[index] as! File
//            let range = NSRange(location: 0, length: file.filename.utf16.count)
//            let regexImage = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].png")
//            let regexVideo = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].mov")
//            if (regexImage.firstMatch(in: file.filename, options: [], range: range) != nil) {
//                outletImage.isHidden = false
//                outletTextView.string = "Image information\n"
//                outletTextView.string.append("\(file.metadata[0])\n")
//                outletTextView.string.append("\(file.metadata[1])\n")
//                outletTextView.isEditable = false
//                outletImage.image = NSImage(contentsOfFile: file.fullpath)
//                outletVideo.isHidden = true
//            } else if (regexVideo.firstMatch(in: file.filename, options: [], range: range) != nil) {
//                outletVideo.isHidden = false
//                outletTextView.string = "Image information\n"
//                outletTextView.string.append("\(file.metadata[0])\n")
//                outletTextView.string.append("\(file.metadata[1])\n")
//                let fileURL = NSURL(fileURLWithPath: file.fullpath);
//                playView = AVPlayer(url: fileURL as URL);
//                outletVideo.player = playView ;
//                outletImage.isHidden = true
//                //outletImage.image = NSImage(contentsOfFile: file.fullpath)
//            }
    }
    
    func displayMedia(file: File) {
        let range = NSRange(location: 0, length: file.filename.utf16.count)
        let regexImage = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].png")
        let regexVideo = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].mov")
        if (regexImage.firstMatch(in: file.filename, options: [], range: range) != nil) {
            outletImage.isHidden = false
            outletTextView.string = "Image information\n"
            outletTextView.string.append("\(file.metadata[0])\n")
            outletTextView.string.append("\(file.metadata[1])\n")
            outletTextView.isEditable = false
            outletImage.image = NSImage(contentsOfFile: file.fullpath)
            outletVideo.isHidden = true
        } else if (regexVideo.firstMatch(in: file.filename, options: [], range: range) != nil) {
            outletVideo.isHidden = false
            outletTextView.string = "Image information\n"
            outletTextView.string.append("\(file.metadata[0])\n")
            outletTextView.string.append("\(file.metadata[1])\n")
            let fileURL = NSURL(fileURLWithPath: file.fullpath);
            playView = AVPlayer(url: fileURL as URL);
            outletVideo.player = playView ;
            outletImage.isHidden = true
            //outletImage.image = NSImage(contentsOfFile: file.fullpath)
        }
    }
    
}
