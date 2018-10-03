//
//  ImportFiles.swift
//  Assignment2
//
//  Created by Sweta Kumari on 10/3/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Cocoa

class ImportFiles: NSObject {
    
    @objc dynamic var newArray: [String] = []
    //@objc dynamic var newArray:String = "hello"
    @objc dynamic var path: Float = 0.05
    
    @objc func importMediaFiles() -> [String]  {
        let importer = JSONImporter()
        let bundlePath = Bundle.main.resourcePath
        var files: [MMFile]
        do {
            files = try importer.read(filename: bundlePath!+"/test.json")
            Swift.print(files[1].path)
            //var newArray: [String] = []
            //var i:Int = 0
            for file in files {
                newArray.append(file.path)
                //mediaFiles.insert(file, at: i)
                //i+=1
            }
            Swift.print(newArray)


        } catch {
            //print("Error found line 149", showPrintPanel: true)
        }
        return(newArray)
    }
    
    override func setNilValueForKey(_ key: String) {
        if key == "expectedRaise" {
            path = 0.0
        }else{
            super.setNilValueForKey(key)
        }
    }

}
