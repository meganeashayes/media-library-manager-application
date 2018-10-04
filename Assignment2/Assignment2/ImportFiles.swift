//
//  ImportFiles.swift
//  Assignment2
//
//  Created by Sweta Kumari on 10/3/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

class ImportFiles: NSObject {
    
    @objc dynamic var path: Float = 0.05
    
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
    
    override func setNilValueForKey(_ key: String) {
        if key == "expectedRaise" {
            //path = 0.0
        }else{
            super.setNilValueForKey(key)
        }
    }

}
