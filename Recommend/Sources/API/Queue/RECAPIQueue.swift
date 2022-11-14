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
    
    // MARK: Add Item
    
    func add(_ item: RECAPIQueueItem) {
        queue.insert(item)
    }
    
    // MARK: Next Item
    
    func next() -> RECAPIQueueItem? {
        guard queue.count > 0 else {
            return nil
        }
        return queue.removeFirst()
    }
}
