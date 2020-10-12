//
//  InterviewTests.swift
//  InterviewTests
//
//  Created by Alkesh Fudani on 12/10/20.
//

import XCTest
@testable import Interview
import ObjectMapper
class InterviewTests: XCTestCase {

    var vm: ViewModel!
    
    override func setUp() {
        super.setUp()
        
        vm = ViewModel()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            vm.fetchData()
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPIWorking() throws {
        (APIManager.get(vm.APIURL()) { (error, json) in
                if error != nil
                {
                    XCTFail("Error: \(error?.localizedDescription ?? "")")
                }else {
                   XCTFail("Success")
                }
            })
    }
}
