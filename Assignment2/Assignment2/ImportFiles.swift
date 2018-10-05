//
//  ImportFiles.swift
//  Assignment2
//
//  Created by Sweta Kumari on 10/3/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

// class importFiles: is a subclass of NSObject, which implements a model, in the MVC pattern. NSArray Controller, class name is set to this class and keys are bind to
class ImportFiles: NSObject {
    
    // Function to add files to mediaFiles(NSMutableArray) from json file type
    // - Parameters:
    //   - mediafiles: dynamic ordered collection to which files are added
    @objc func importMediaFiles(mediaFiles: NSMutableArray)  {
        let importer = JSONImporter()
        let bundlePath = Bundle.main.resourcePath
        var files: [MMFile]
        do {
            files = try importer.read(filename: bundlePath!+"/test.json")
            var i: Int = 0
            for file in files {
                var newFile = File(path: file.path, filename: file.filename, metadata: file.metadata)
                mediaFiles.add(newFile)
                i += 1
            }
        } catch {
            print("Could not import files")
        }
    }
}
