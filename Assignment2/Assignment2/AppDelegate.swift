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
class AppDelegate: NSObject, NSApplicationDelegate, NSSearchFieldDelegate {
    
    @objc dynamic var mediaFiles = NSMutableArray()
    

    var isSearching = false
    var filterData = [String]()
    var playView = AVPlayer()
    var soundPlayer =  AVAudioPlayer()
    
    @IBOutlet weak var window: NSWindow!
    var last = MMResultSet()
    @IBOutlet var outletTextView: NSTextView!
    @IBOutlet weak var outletImage: NSImageView!
    //@IBOutlet weak var outletImage: IKImageView!
    @IBOutlet weak var outletVideo: AVPlayerView!
    @IBOutlet weak var outletscroll: NSScrollView!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var tableContent: NSScrollView!
    
    @IBOutlet weak var searchBar: NSSearchField!
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
    @IBOutlet weak var outletTextFileView: NSTextView!
    
    
    let aboutWindow = aboutPageController()

    //searchBar.delegate = self
    
    /// When application launches, the media containers (outlets), metadata display and media notes
    /// are hidden automatically; these will display only once a media file is selected to be displayed. Files are imported into the library automatically on application launch.
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let bundlePath = Bundle.main.resourcePath
        
        outletTextView.isHidden = true
        outletscroll.isHidden = true
        outletNotes.isHidden = true
        outletVideo.isHidden = true
        outletImage.isHidden = true
        outletTextFileView.isHidden = true
        
        let importer = ImportFiles()
        importer.importMediaFiles(mediaFiles: mediaFiles)
        
        if let filepath = Bundle.main.path(forResource: "readme", ofType: "txt"){

            do {
                let contents = try String(contentsOfFile: filepath)
                outletTextView.string = contents
                outletTextView.isEditable = false

            } catch {
                print("Contents could not be loaded")
            }
        } else {
            print ("Filepath could not be found")
        }
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
   

    
    // To open About page window when clicking about aboutPage tab
    @IBAction func openAboutWindow(_ sender: Any) {
        aboutWindow.window?.setIsVisible(true)
    }
    
    
    
    /// Zooms out the view of the current media
    @IBAction func zoomOut(_ sender: NSButton) {
         outletImage.scaleUnitSquare(to: NSSize(width: 0.75, height: 0.75))
    }
    
    /// Imports files into the media library
    @IBAction func importFiles(_ sender: Any) {
        let importer = ImportFiles()
        importer.importMediaFiles(mediaFiles: mediaFiles)
    }
    
    /// Exports files and saves them as a JSON file
    @IBAction func exportFiles(_ sender: Any) {
        let exporter = JSONExporter()
        var count: Int = 0
        do {
            try exporter.write(filename: "newFiles\(count).json", items: mediaFiles as! [MMFile])
            count += 1
        } catch {
            print("File could not be exported")
        }
        
    }
    
    /// Zooms in the view of the current media
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
//        let newSize: NSSize = NSMakeSize(size.width * 0.9, size.height * 0.9)
//
//        outletImage.setBoundsSize(newSize)
    }
    
    /// Enables media (image/video etc.) to be displayed in the application when the media name
    /// is clicked in the table
    ///
    /// Uses regular expressions to identify the kind of media to display, and thus which media
    /// container to show on the screen. Displays the metadata associated with the file in a TextView below the media container, and hides the media container which is not in use at the time
    @IBAction func tableViewAction(_ sender: Any) {
        let index: Int = tableView.selectedRow
        if index > -1 {
            let file: File =  mediaFiles[index] as! File
            let range = NSRange(location: 0, length: file.filename.utf16.count)
            let regexImage = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].png")
            let regexVideo = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].mov")
            let regexAudio = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].m4a")
            let regexDocument = try! NSRegularExpression(pattern: "[a-zA-Z0-9\\-\\_].txt")
            outletscroll.isHidden = false
            outletTextView.isHidden = false
            outletNotes.isHidden = false
            if (regexImage.firstMatch(in: file.filename, options: [], range: range) != nil) {
                outletImage.isHidden = false
                outletTextView.string = "Image information:\n"
                outletTextView.string.append("\(file.metadata[0])\n")
                outletTextView.string.append("\(file.metadata[1])\n")
                outletTextView.isEditable = false
                outletImage.image = NSImage(contentsOfFile: file.fullpath)
                outletVideo.isHidden = true
                outletTextFileView.isHidden = true
            } else if (regexVideo.firstMatch(in: file.filename, options: [], range: range) != nil) {
                outletVideo.isHidden = false
                outletTextView.string = "Video information:\n"
                outletTextView.string.append("\(file.metadata[0])\n")
                outletTextView.string.append("\(file.metadata[1])\n")
                let fileURL = NSURL(fileURLWithPath: file.fullpath)
                let playView = AVPlayer(url: fileURL as URL)
                outletVideo.player = playView
                outletImage.isHidden = true
                outletTextFileView.isHidden = true
                //outletImage.image = NSImage(contentsOfFile: file.fullpath)
            } else if (regexAudio.firstMatch(in: file.filename, options: [], range: range) != nil) {
                outletVideo.isHidden = false
                let fileURL = NSURL(fileURLWithPath: file.fullpath)
                let playView = AVPlayer(url: fileURL as URL)
                outletVideo.player = playView
                outletTextView.string = "Audio information:\n"
                outletTextView.string.append("\(file.metadata[0])\n")
                outletTextView.string.append("\(file.metadata[1])\n")
                outletImage.isHidden = true
                outletTextFileView.isHidden = true
            } else if (regexDocument.firstMatch(in: file.filename, options: [], range: range) != nil) {
                do {
                    outletTextFileView.isHidden = false
                    let contents = try NSString(contentsOfFile: file.filename, encoding: String.Encoding.utf8.rawValue)
                    outletTextFileView.string = contents as String
                    outletTextView.string = "Document information:\n"
                    outletTextView.string.append("\(file.metadata[0])\n")
                    outletVideo.isHidden = true
                    outletImage.isHidden = true
                } catch {
                    
                }
                //let contents = try NSString(contentsOfFile: file.path, encoding: String.Encoding.utf8.rawValue)
                //outletTextFileView.string = contents as String
                outletTextView.string = "Document information:\n"
                outletTextView.string.append("\(file.metadata[0])\n")
                outletVideo.isHidden = true
                outletImage.isHidden = true
            }
        } else {
            outletTextView.string = "File doesn't exist"
        }
        
    }
    
}
