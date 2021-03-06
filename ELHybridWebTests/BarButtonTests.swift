//
//  BarButtonTests.swift
//  ELHybridWeb
//
//  Created by Angelo Di Paolo on 9/1/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import UIKit
import XCTest
@testable import ELHybridWeb

class BarButtonTests: XCTestCase {
    
    var actionJSONArray: [Any] {
        let actionOne = ["id": "action1", "title": "Action 1"]
        let actionTwo = ["id": "action2", "title": "Action 2"]
        return [actionOne, actionTwo]
    }
    
    func testDictionaryFromJSONArray() {
        let buttons: [Int: BarButton] = BarButton.dictionary(fromJSONArray: actionJSONArray, callback: nil)
        
        let buttonOne = buttons[0]
        XCTAssertNotNil(buttonOne)
        XCTAssertEqual(buttonOne!.title, "Action 1")
        XCTAssertEqual(buttonOne!.id, "action1")
        
        let buttonTwo = buttons[1]
        XCTAssertNotNil(buttonTwo)
        XCTAssertEqual(buttonTwo!.title, "Action 2")
        XCTAssertEqual(buttonTwo!.id, "action2")
    }
    
    func testBarButtonItemProperty() {
        let buttons: [Int: BarButton] = BarButton.dictionary(fromJSONArray: actionJSONArray, callback: nil)
        let firstButton = buttons[0]!
        let barButtonItem = firstButton.barButtonItem
        
        XCTAssertEqual(barButtonItem.title!, firstButton.title)
        XCTAssertTrue(barButtonItem.target! is BarButton)
        XCTAssertTrue(barButtonItem.target as! BarButton === firstButton)
    }
}
