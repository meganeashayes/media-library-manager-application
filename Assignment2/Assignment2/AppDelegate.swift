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
import Quartz

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @objc dynamic var mediaFiles = NSMutableArray()
    
    //var playView = AVPlayer()
    //var soundPlayer =  AVAudioPlayer()
    @IBOutlet weak var window: NSWindow!
    var last = MMResultSet()
    @IBOutlet var outletTextView: NSTextView!
    @IBOutlet weak var outletImage: NSImageView!
    //@IBOutlet weak var outletImage: IKImageView!
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
    @IBOutlet weak var imageNotes: NSTextField!
    @IBOutlet weak var imageInformation: NSTextField!
    @IBOutlet weak var displayImage: NSImageView!
    @IBOutlet weak var outletNotes: NSTextField!
    
    
    let aboutWindow = aboutPageController();
    let imageWindow = DisplayController();
    //let audiotest: AVAudioPlayer
    
//    @IBAction func play(_ sender: NSButtonCell) {
//        print("playing") ;
//        print ("playing2");
////        soundPlayer.play();
//        playView.play();
//        
//    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let bundlePath = Bundle.main.resourcePath
        
        outletTextView.isHidden = true
        outletscroll.isHidden = true
        outletNotes.isHidden = true
        outletVideo.isHidden = true
        outletImage.isHidden = true
        
        //outletImage.image = NSImage(contentsOfFile: mediaFiles[0] as! String)
        //print("\(mediaFiles[0])")
        //outletTextView.string = "An Image"
        
        if let filepath = Bundle.main.path(forResource: "readme", ofType: "txt"){
            //print(filepath)

            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
                outletTextView.string = contents;
                outletTextView.isEditable = false ;

            } catch {
                // contents could not be loaded
            }
        } else {
            print ("else");
        }
        
       
        
//        let fileURL = NSURL(fileURLWithPath: "/home/cshome/s/skumari/346/assignment-two-media-manager-gui-swift-assignment-2sweta/Assignment2/test.mov");
//        playView = AVPlayer(url: fileURL as URL);
//        outletVideo.player = playView ;
//        print("video")
        
//        do {
//            soundPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "m4a")!))
//            soundPlayer.prepareToPlay();
//            print("playing")
//        } catch {
//        }
        
        //To get metadata of audio filebf
        //let fileURL = NSURL(fileURLWithPath: "/home/cshome/s/skumari/346/assignment-two-media-manager-gui-swift-assignment-2sweta/Assignment2/test.m4a");
        let fileURL = NSURL(fileURLWithPath: bundlePath! + "/test.m4a");
        let asset = AVAsset(url: fileURL as URL);
        //asset.player = playView ;
        print("audio")
        let formatsKey = "availableMetadataFormats"
        
       asset.loadValuesAsynchronously(forKeys: [formatsKey]) {
            var error: NSError? = nil
            let status = asset.statusOfValue(forKey: formatsKey, error: &error)
            if status == .loaded {
                for format in asset.availableMetadataFormats {
                    let metadata = asset.metadata(forFormat: format)
                    // process format-specific metadata collection
                    print(metadata)
                    
                }
            }
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
   

    
    // To open About page window when clicking about aboutPage tab
    @IBAction func openAboutWindow(_ sender: Any) {
        aboutWindow.window?.setIsVisible(true)
    }
    
    
    
    
    @IBAction func zoomOut(_ sender: NSButton) {
         outletImage.scaleUnitSquare(to: NSSize(width: 0.75, height: 0.75))
    }
    
    @IBAction func importFiles(_ sender: NSButton) {
        print("Line 149 is working")
        let importer = ImportFiles()
        importer.importMediaFiles(mediaFiles: mediaFiles)
        print("\(mediaFiles[1])")
    }
    
    func tableView(_ tableView: NSTableView, didSelectRowAt indexPath: IndexPath) {
        // self.view.backgroundColor = UIColor.blue
        //let detail: NSImageView = self.outletImage
        //outletImage.image = NSImage(named: mediaFiles[indexPath.item]["image"])
        //detail.image =

       // let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        detail.strlbl1 = array1[indexPath.row]
//        detail.strlbl2 = array2[indexPath.row]
//        detail.strimg = arrimg[indexPath.row]
//        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    @IBAction func zoomIn(_ sender: NSButton) {
//        var t = CGAffineTransform.identity
//        t = t.translatedBy(x: -100, y: -300)
//        t = t.scaledBy(x: 2, y: 2)
//
//        outletImage.layer?.setAffineTransform(t)
//        outletImage.layer?.setAffineTransform(CGAffineTransform.identity)
        outletImage.scaleUnitSquare(to: NSSize(width: 1.25, height: 1.25))
//        let size:NSSize = outletImage.bounds.size
//
//        let newSize: NSSize = NSMakeSize(size.width * 0.9, size.height * 0.9);
//
//        outletImage.setBoundsSize(newSize);
    }
    
    
    @IBAction func tableViewAction(_ sender: Any) {
        let index: Int = tableView.selectedRow
        if index > -1 {
            
            let file: File =  mediaFiles[index] as! File
            //imageWindow.displayMedia(file: file)
            let range = NSRange(location: 0, length: file.filename.utf16.count)
            let regexImage = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].png")
            let regexVideo = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].mov")
            let regexAudio = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].m4a")
            outletscroll.isHidden = false
            outletTextView.isHidden = false
            outletNotes.isHidden = false
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
                let fileURL = NSURL(fileURLWithPath: file.fullpath)
                let playView = AVPlayer(url: fileURL as URL)
                outletVideo.player = playView
                outletImage.isHidden = true
                //outletImage.image = NSImage(contentsOfFile: file.fullpath)
            } else if (regexAudio.firstMatch(in: file.filename, options: [], range: range) != nil) {
                outletVideo.isHidden = false
                let fileURL = NSURL(fileURLWithPath: file.fullpath)
                let playView = AVPlayer(url: fileURL as URL)
                outletVideo.player = playView
                outletTextView.string = "Image information\n"
                outletTextView.string.append("\(file.metadata[0])\n")
                outletTextView.string.append("\(file.metadata[1])\n")
                outletImage.isHidden = true
            }
            //imageWindow.window?.setIsVisible(true)
//            outletTextView.string = "Image information"
//            outletTextView.string.append("\(file.metadata[0])")
//            outletTextView.string.append("\(file.metadata[1])")
//            outletImage.image = NSImage(contentsOfFile: file.fullpath)
        } else {
            outletTextView.string = "File doesn't exist"
        }
        
    }
    
}
