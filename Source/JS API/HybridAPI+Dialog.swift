//
//  HybridAPI+Dialog.swift
//  ELHybridWeb
//
//  Created by Angelo Di Paolo on 5/4/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation
import JavaScriptCore

@objc protocol DialogJSExport: JSExport {
    func dialog(options: [String: AnyObject], _ callback: JSValue)
}

extension HybridAPI {
    
    func dialog(options: [String: AnyObject], _ callback: JSValue) {
        THGHybridWebLogger.sharedLogger.log(.Debug, message: "options:\(options), callback\(callback)") // provide breadcrumbs
        dialog.show(options, callback: callback)
    }
}
