//
//  RECMessagingFailedPushEventsStorage.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 11.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECMessagingFailedPushEventsStorage {
    private let fileManager: FileManager
    private let fileURL: URL
    private var _events: [RECMessagingPushEvent] = []
    
    var events: [RECMessagingPushEvent] {
        get {
            do {
                return try readFromFile()
            } catch {
                return _events
            }
        }
        set {
            _events = newValue
            try? writeToFile(newValue)
        }
    }
    
    // MARK: Init
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
        var url = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask)[0]
        url.appendPathComponent("REC_MESSAGING_FAILED_PUSH_EVENTS.json")
        if fileManager.fileExists(atPath: url.path) == false {
            fileManager.createFile(atPath: url.path, contents: nil)
        }
        self.fileURL = url
    }
    
    // MARK: Read
    
    private func readFromFile() throws -> [RECMessagingPushEvent] {
        let data = try Data(
            contentsOf: fileURL,
            options: [])
        return try JSONDecoder().decode(
            [RECMessagingPushEvent].self,
            from: data)
    }
    
    private func writeToFile(_ events: [RECMessagingPushEvent]) throws {
        let data = try JSONEncoder().encode(events)
        try data.write(to: fileURL, options: [])
    }
}
