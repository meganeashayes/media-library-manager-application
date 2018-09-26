//
//  AppDelegate.swift
//  Assignment2
//
//  Created by sweta on 10/09/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var playView = AVPlayer();
    var soundPlayer =  AVAudioPlayer();
    @IBOutlet weak var window: NSWindow!
    var library: Collection = Collection()
    var last = MMResultSet()
    @IBOutlet var outletTextView: NSTextView!
    @IBOutlet weak var outletImage: NSImageView!
    @IBOutlet weak var outletVideo: AVPlayerView!
    @IBOutlet weak var outletscroll: NSScrollView!
    @IBOutlet weak var aboutWindow: NSView!

    @IBOutlet weak var aboutWindowText: NSTextField!
    
    @IBOutlet weak var searchTab: NSSearchField!
    @IBOutlet weak var searchForward: NSButton!
    @IBOutlet weak var searchBackward: NSButton!
    @IBOutlet weak var zoomInButton: NSButton!
    @IBOutlet weak var zoomOutButton: NSButton!
    @IBOutlet weak var fitButton: NSButton!
    @IBOutlet weak var lastPageButton: NSButton!
    @IBOutlet weak var nextPageButton: NSButton!
    
    @IBAction func play(_ sender: NSButtonCell) {
        print("playing") ;
//        soundPlayer.play();
        playView.play();
        
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        // print("test");
        
        let bundlePath = Bundle.main.resourcePath
        
        
         print(bundlePath!) ;
        outletImage.image = NSImage(contentsOfFile: bundlePath!+"/home/cshome/s/skumari/346/test.png")


        if let filepath = Bundle.main.path(forResource: "readme", ofType: "txt"){

            do {
                let contents = try String(contentsOfFile: filepath)
                // print(contents)
                outletTextView.string = contents;
                outletTextView.isEditable = false ;

            } catch {
                // contents could not be loaded
            }
        } else {
            print ("else");
        }
        
        
        let fileURL = NSURL(fileURLWithPath: "/home/cshome/s/skumari/346/test.mov");
        playView = AVPlayer(url: fileURL as URL);
        outletVideo.player = playView ;
        print("video")
        
//        do {
//            soundPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "m4a")!))
//            soundPlayer.prepareToPlay();
//            print("playing")
//        } catch {
//        }
        
        outletscroll.isHidden=false;
        outletVideo.isHidden=false;
        outletImage.isHidden = false;
        
        // about window regarding app
        let aboutSize: NSSize = CGSize(width: 200, height: 250)
        aboutWindow.window?.setIsVisible(false)
        aboutWindow.setFrameSize(aboutSize)
        aboutWindowText.stringValue = "This is application to manage media collection.\n Developed by Sweta Kumari and Megan Hayes created for the University of Otago, COSC-346 Assignment2."

    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
   
    
    @IBAction func openAboutWindow(_ sender: Any) {
    aboutWindow.window?.setIsVisible(true)
    aboutWindow.window?.setTitleWithRepresentedFilename("About")
    }
    
    
    @IBAction func zoomIn(_ sender: NSButton) {
        //library.zoomIn(sender)
    }
    
    
    
}
