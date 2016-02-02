//
//  HybridAPI+Logging.swift
//  ELHybridWeb
//
//  Created by Angelo Di Paolo on 5/11/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation
import JavaScriptCore

@objc protocol HybridLoggingJSExport: JSExport {
    func log(value: AnyObject)
}

extension HybridAPI {
    func log(value: AnyObject) {
        print("HybridAPI: \(value)")
    }
}
