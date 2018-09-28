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
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var tableContent: NSScrollView!
   
    
    @IBOutlet weak var searchTab: NSSearchField!
    @IBOutlet weak var searchForward: NSButton!
    @IBOutlet weak var searchBackward: NSButton!
    @IBOutlet weak var zoomInButton: NSButton!
    @IBOutlet weak var zoomOutButton: NSButton!
    @IBOutlet weak var fitButton: NSButton!
    @IBOutlet weak var lastPageButton: NSButton!
    @IBOutlet weak var nextPageButton: NSButton!
    
    let timerWindow = aboutPageController();
    
    
    @IBAction func play(_ sender: NSButtonCell) {
        print("playing") ;
//        soundPlayer.play();
        playView.play();
        
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        // print("test");
      
        //openAboutWindow(self)
        
        let bundlePath = Bundle.main.resourcePath
        
        
         print(bundlePath!) ;
        
        outletImage.image = NSImage(contentsOfFile: "/home/cshome/s/skumari/346/assignment-two-media-manager-gui-swift-assignment-2sweta/Assignment2/MediaLibraryManager/test.json")

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
        
        
        let fileURL = NSURL(fileURLWithPath: "/home/cshome/s/skumari/346/assignment-two-media-manager-gui-swift-assignment-2sweta/Assignment2/test.mov");
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

    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
   

    // To open About page window when clicking about aboutPage tab
    @IBAction func openAboutWindow(_ sender: Any) {
        timerWindow.window?.setIsVisible(true)
    }
    
    
    @IBAction func zoomIn(_ sender: NSButton) {
        //library.zoomIn(sender)
    }
    
    
    
}
