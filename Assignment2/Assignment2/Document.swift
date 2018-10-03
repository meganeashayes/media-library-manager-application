//
//  Document.swift
//  Assignment2
//
//  Created by Sweta Kumari on 9/27/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

    
    class Document: NSDocument {
        @objc dynamic private static var myContext = 0
        @objc dynamic var mediaFiles = NSMutableArray()
        //        {
        //
        //        willSet {
        //            for file in mediaFiles {
        //                stopObservingPerson(file as! File)
        //            }
        //        }
        //        didSet {
        //            for file in mediaFiles {
        //                startObservingPerson(file as! File)
        //            }
        //        }
        //    }
        
        //    @objc func importMediaFiles() {
        //        let importer = JSONImporter()
        //        let bundlePath = Bundle.main.resourcePath
        //        var files: [MMFile]
        //        do {
        //            files = try importer.read(filename: bundlePath!+"/test.json")
        //            Swift.print(files[1].path)
        //            var newArray: [String] = []
        //            var i:Int = 0
        //            for file in files {
        //                newArray.append(file.path)
        //                mediaFiles.insert(file, at: i)
        //                i+=1
        //            }
        //            Swift.print(newArray)
        //
        //
        //        } catch {
        //            //print("Error found line 149", showPrintPanel: true)
        //        }
        //    }
        
        
        /*
         override var windowNibName: String? {
         // Override returning the nib file name of the document
         // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
         return "Document"
         }
         */
        
        override init() {
            super.init()
        }
        
        
        override func windowControllerDidLoadNib(_ aController: NSWindowController) {
            super.windowControllerDidLoadNib(aController)
            // Add any code here that needs to be executed once the windowController has loaded the document's window.
            
            let ourViewController = aController.contentViewController
            ourViewController?.representedObject = self
        }
        
        override func data(ofType typeName: String) throws -> Data {
            // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
            // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
        
        override func read(from data: Data, ofType typeName: String) throws {
            // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning false.
            // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
            // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
        
        class func autosavesInPlace() -> Bool {
            return true
        }
        
        @objc func insertObject(_ p:File, inEmployeesAtIndex index:Int){
            NSLog("adding %@ to %@",p,mediaFiles)
            // add the inverse of the insertion action to the undo stack
            if let undo = self.undoManager {
                (undo.prepare(withInvocationTarget: self) as AnyObject).removeObjectFromEmployeesAtIndex(index)
                if !undo.isUndoing {
                    undo.setActionName("Add Person")
                }
                // Add the person to the NSMutableArray
                mediaFiles.insert(p, at: index)
            }
        }
        
        @objc func removeObjectFromEmployeesAtIndex(_ index:Int){
            let p = mediaFiles.object(at: index) as! File
            NSLog("removing %@ from %@",p,mediaFiles)
            // add the inverse of the insertion action to the undo stack
            if let undo = self.undoManager {
                (undo.prepare(withInvocationTarget: self) as AnyObject).insertObject(p, inEmployeesAtIndex: index)
                if !undo.isUndoing {
                    undo.setActionName("Remove Person")
                }
                // Remove the person from the NSMutableArray
                mediaFiles.removeObject(at: index)
            }
        }
        
        
        override func makeWindowControllers() {
            // Returns the Storyboard that contains your Document window.
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
            let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Document Window Controller")) as! NSWindowController
            self.addWindowController(windowController)
            let ourViewController = windowController.contentViewController
            ourViewController?.representedObject = self
            
        }

}
