//
//  Assignment2Tests.swift
//  Assignment2Tests
//
//  Created by Megan Hayes on 10/5/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import XCTest

class Assignment2Tests: XCTestCase {
    
    var filename: String = "test.json"
    //var alltypesFilename: String = "automatically-generated-test-alltypes.json"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        var home = FileManager.default.homeDirectoryForCurrentUser
//        home.appendPathComponent(filename)
//
//        var current = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
//        current.appendPathComponent(filename)
//
//        //var alltypes = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
//        //alltypes.appendPathComponent(alltypesFilename)
//
//        do {
//            try singleDocumentValid.write(to: home, atomically: true, encoding: String.Encoding.utf8)
//            try singleDocumentValid.write(to: current, atomically: true, encoding: String.Encoding.utf8)
//            //try allTypesValid.write(to: alltypes, atomically: true, encoding: String.Encoding.utf8)
//        } catch {
//            // failed to write file – bad permissions, bad filename,
//            // missing permissions, or more likely it can't be converted to the encoding
//            XCTFail("something went wrong writing files ... \(error)")
//        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFromFullPath() {
//        var current = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
//        current.appendPathComponent(filename)
//
//        let loader = JSONImporter()
//        do {
//            let result = try loader.read(filename: current.path)
//            XCTAssert(result.count > 0, "Expected to read *some* data")
//        } catch {
//            XCTFail("Generated un expected exception")
//        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
