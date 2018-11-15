//
//  LabTunesTests.swift
//  LabTunesTests
//
//  Created by Abraham Quezada on 11/9/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import XCTest
@testable import LabTunes

class LabTunesTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let session = Session.sharedInstance
        session.token = nil
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCorrectLogin(){
        XCTAssertTrue(User.login(userName: "iOSLab", password: "Hola"))
    }
    
    func testWrongLogin(){
        XCTAssertFalse(User.login(userName: "Abraham", password: "Hi"))
    }
    
    func testSaveSession(){
        let session = Session.sharedInstance
        let _ = User.login(userName: "iOSLab", password: "223")
        XCTAssertNotNil(session.token)
    }
    
    func testFailSaveSession(){
        let session = Session.sharedInstance
        let _ = User.login(userName: "Abe", password: "223")
        XCTAssertNil(session.token)
    }
    
    func testExpectedToken(){
        let _ = User.login(userName: "iOSLab", password: "233")
        let session = Session.sharedInstance
        XCTAssertEqual(session.token!, "1234567890", "Token Should Match")
        XCTAssertNotEqual(session.token!, "123456789", "Token Shouldn't Match")
    }
    
   func testSessionError(){
        XCTAssertThrowsError(try User.fetchSongs())
    }

}
