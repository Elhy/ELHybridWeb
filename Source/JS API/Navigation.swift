//
//  Navigation.swift
//  THGHybridWeb
//
//  Created by Angelo Di Paolo on 4/22/15.
//  Copyright (c) 2015 TheHolyGrail. All rights reserved.
//

import JavaScriptCore

@objc protocol NavigationJSExport: JSExport {
    func animateForward(options: JSValue,  _ callback: JSValue)
    func animateBackward()
    func popToRoot()
    func setOnBack(callback: JSValue)
}

@objc public class Navigation: ViewControllerChild, NavigationJSExport {
    
    var topWebViewController: WebViewController? {
        return parentViewController?.navigationController?.topViewController as? WebViewController
    }
    private var onBackCallback: JSValue?

    func animateForward(options: JSValue, _ callback: JSValue) {
        THGHybridWebLogger.sharedLogger.log(.Debug, message: "options:\(options), callback:\(callback)") // provide breadcrumbs
        dispatch_async(dispatch_get_main_queue()) {
            let vcOptions = WebViewControllerOptions(javaScriptValue: options)
            self.webViewController?.pushWebViewControllerWithOptions(vcOptions)
        }
    }
    
    func animateBackward() {
        THGHybridWebLogger.sharedLogger.log(.Debug, message: "") // provide breadcrumbs
        dispatch_async(dispatch_get_main_queue()) {
            self.webViewController?.popWebViewController()
        }
    }
    
    func popToRoot() {
        THGHybridWebLogger.sharedLogger.log(.Debug, message: "") // provide breadcrumbs
        dispatch_async(dispatch_get_main_queue()) {
            self.parentViewController?.navigationController?.popToRootViewControllerAnimated(false)
        }
    }

    func back() {
        THGHybridWebLogger.sharedLogger.log(.Debug, message: "") // provide breadcrumbs
        if let validCallbackValue = onBackCallback?.asValidValue {
            onBackCallback?.safelyCallWithArguments(nil)
        } else {
            webViewController?.webView.stopLoading()
            webViewController?.webView.delegate = topWebViewController
            webViewController?.webView.goBack()
        }
    }

    func setOnBack(callback: JSValue) {
        THGHybridWebLogger.sharedLogger.log(.Debug, message: "callback:\(callback)") // provide breadcrumbs
        onBackCallback = callback
    }
}
