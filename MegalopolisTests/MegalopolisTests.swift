//
//  MegalopolisTests.swift
//  MegalopolisTests
//
//  Created by o_ame on 2014/07/09.
//
//

import UIKit
import XCTest
import Megalopolis

class MegalopolisTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetIndexes() {
        let done = {(data: Megalopolis.Data!, error: NSError!) -> Void in
            var json = data! as [String: AnyObject]
            var objects: AnyObject? = json["entries"] as NSMutableArray?
            XCTAssertNotNil(objects)
        }
        Megalopolis.getIndexes(0, done)
    }
}
