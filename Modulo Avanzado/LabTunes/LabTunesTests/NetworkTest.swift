//
//  NetworkTest.swift
//  LabTunesTests
//
//  Created by Abraham Quezada on 11/9/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import XCTest
@testable import LabTunes

class NetworkTest: XCTestCase{
    var sessionUnderTest: URLSession!
    
    override func setUp(){
        super.setUp()
        sessionUnderTest = URLSession(configuration: .default)
    }
    
    func testValidCallToItunes(){
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        var statusCode: Int?
        var responseError: Error?
        let promise = expectation(description: "Handler Invoked")
        
        let dataTask = sessionUnderTest.dataTask(with: url!){ data, response,
            error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill() //Cumple con la promesa
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testSlowValidCallToItunes(){
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Nirvana")
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!){ data, response,
            error in
            if let error = error{
                XCTFail("Error: (\(error.localizedDescription)")
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode{
                if statusCode == 200{
                    promise.fulfill()
                }else{
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testMusicSongs(){
        var resultSongs: [Song] = []
        let promise = expectation(description: "It called at least one song")
        Music.fetchSongs{ (songs) in
            resultSongs = songs
            promise.fulfill()
            //print(resultSongs)
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(resultSongs.count, 0)
    }
}
