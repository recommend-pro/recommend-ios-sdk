//
//  RECAPIQueue.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 11.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIQueue {
    
    private var queue: Set<RECAPIQueueItem> = []
    private let lock = NSLock()
    
    // MARK: Add Item
    
    func add(_ item: RECAPIQueueItem) {
        self.lock.lock()
        defer { self.lock.unlock() }
        
        queue.insert(item)
    }
    
    // MARK: Next Item
    
    func next() -> RECAPIQueueItem? {
        
        self.lock.lock()
        defer { self.lock.unlock() }
        
        guard queue.count > 0 else {
            return nil
        }
        return queue.removeFirst()
    }
}
