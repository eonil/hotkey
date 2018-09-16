//
//  Audit.swift
//  HotKey
//
//  Created by Henry on 2018/09/15.
//  Copyright © 2018 Eonil. All rights reserved.
//

import Foundation

struct Audit {
    static func check(_ condition: Bool, _ message: String) {
        guard condition else {
            print(message)
            return
        }
    }
}
