//
//  File.swift
//  MediaLibraryManager
//
//  Created by Paul Crane on 27/08/18.
//  Copyright © 2018 Paul Crane. All rights reserved.
//

import Foundation
class File: MMFile {
    var metadata: [MMMetadata]
    var filename: String
    var path: String
    var fullpath: String

    var description: String {
        return "\(self.filename)"
    }

    required init(path: String, filename: String, metadata: [MMMetadata]) {
        self.path = path
        self.filename = filename
        self.metadata = metadata
        self.fullpath = filename + path
    }

    convenience init(path: String, filename: String) {
        self.init(path: path, filename: filename, metadata: [])
    }

    convenience init() {
        self.init(path: "", filename: "", metadata: [])
    }

    func add(keyword: String, value: String) {
        // swiftlint:disable:next identifier_name
        let md = Metadata(keyword: keyword, value: value)
        self.metadata.append(md)
    }

    class var requiredMetadata: Set<String> {
        return Set<String>()
    }

    class var validator: ValidatorSuite {
        var validators: [KeywordValidator] = []
        for keyword in self.requiredMetadata {
            validators.append(KeywordValidator(keyword: keyword))
        }
        return ValidatorSuite(validators: validators)
    }

    class func extractRequiredMetadata(from metadata: [MMMetadata]) -> [String: MMMetadata] {
        var result: [String: MMMetadata] = [:]
        for item in metadata {
            if self.requiredMetadata.contains(item.keyword) {
                result[item.keyword] = item
            }
        }
        return result
    }
}

class DocumentFile: File {
    override class var requiredMetadata: Set<String> {
        return Set<String>(["creator"])
    }

    required init(path: String, filename: String, metadata: [MMMetadata]) {
        super.init(path: path, filename: filename, metadata: metadata)
    }

    convenience init(path: String,
                     filename: String,
                     metadata: [MMMetadata],
                     creator: MMMetadata) {

        // swiftlint:disable:next identifier_name
        var md = metadata
        if !metadata.contains(where: {$0.keyword == creator.keyword}) {
            md.append(creator)
        }
        self.init(path: path, filename: filename, metadata: md)
    }

    convenience init(path: String, filename: String, creator: MMMetadata) {
        self.init(path: path, filename: filename, metadata: [creator], creator: creator)
    }

    convenience init(creator: MMMetadata) {
        self.init(path: "", filename: "", metadata: [creator], creator: creator)
    }
}

class ImageFile: File {
    override class var requiredMetadata: Set<String> {
        return Set<String>(["creator", "resolution"])
    }

    required init(path: String, filename: String, metadata: [MMMetadata]) {
        super.init(path: path, filename: filename, metadata: metadata)
    }

    convenience init(path: String,
                     filename: String,
                     metadata: [MMMetadata],
                     creator: MMMetadata,
                     resolution: MMMetadata) {
        
        self.init(path: path, filename: filename, metadata: metadata)
    }

    convenience init(path: String, filename: String, creator: MMMetadata, resolution: MMMetadata) {
        self.init(path: path,
                  filename: filename,
                  metadata: [creator, resolution],
                  creator: creator,
                  resolution: resolution)
    }

    convenience init(creator: MMMetadata, resolution: MMMetadata) {
        self.init(path: "",
                  filename: "",
                  metadata: [creator, resolution],
                  creator: creator,
                  resolution: resolution)
    }
}

class AudioFile: File {

    override class var requiredMetadata: Set<String> {
        return Set<String>(["creator", "runtime"])
    }

    required init(path: String, filename: String, metadata: [MMMetadata]) {
        super.init(path: path, filename: filename, metadata: metadata)
    }

    convenience init(path: String, filename: String, metadata: [MMMetadata], creator: MMMetadata, runtime: MMMetadata) {

        self.init(path: path, filename: filename, metadata: metadata)
    }

    convenience init(path: String, filename: String, creator: MMMetadata, runtime: MMMetadata) {
        self.init(path: path, filename: filename, metadata: [creator, runtime], creator: creator, runtime: runtime)
    }

    convenience init(creator: MMMetadata, runtime: MMMetadata) {
        self.init(path: "", filename: "", metadata: [creator, runtime], creator: creator, runtime: runtime)
    }
}

class VideoFile: File {

    override class var requiredMetadata: Set<String> {
        return Set<String>(["creator", "runtime", "resolution"])
    }

    required init(path: String, filename: String, metadata: [MMMetadata]) {
        super.init(path: path, filename: filename, metadata: metadata)
    }

    convenience init(path: String,
                     filename: String,
                     metadata: [MMMetadata],
                     creator: MMMetadata,
                     resolution: MMMetadata,
                     runtime: MMMetadata) {

        self.init(path: path, filename: filename, metadata: metadata)
    }

    convenience init(path: String,
                     filename: String,
                     creator: MMMetadata,
                     resolution: MMMetadata,
                     runtime: MMMetadata) {

        self.init(path: path,
                  filename: filename,
                  metadata: [creator, resolution, runtime],
                  creator: creator,
                  resolution: resolution,
                  runtime: runtime)
    }

    convenience init(creator: MMMetadata, resolution: MMMetadata, runtime: MMMetadata) {
        self.init(path: "",
                  filename: "",
                  metadata: [creator, resolution, runtime],
                  creator: creator,
                  resolution: resolution,
                  runtime: runtime)
    }
}
