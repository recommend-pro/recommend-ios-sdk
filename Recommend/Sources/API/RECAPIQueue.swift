//
//  RECAPIQueue.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 23.01.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIQueue {
    private var tasks: [RECAPIDataTask] = []
    
    var count: Int {
        return tasks.count
    }
    
    // MARK: Add task
    
    func add(_ task: RECAPIDataTask) {
        tasks.append(task)
    }
    
    // MARK: Next task
    
    func next() -> RECAPIDataTask? {
        guard tasks.count > 0 else {
            return nil
        }
        return tasks.removeFirst()
    }
}
