//
//  DogTests.swift
//  DogTests
//
//  Created by Rahul Mayani on 14/04/21.
//

import RxSwift
import RxCocoa

import XCTest

class DogTests: XCTestCase {

    // MARK: - Variable -
    private let rxbag = DisposeBag()
    private let listingVM = DogListingVM()
    
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
            // Put the code you want to measure the time of here.
        }
    }

    // MARK: - Test Case -
    func testDataFechingFromServer() {
        
        // get data from server or local db
        listingVM.getDataFromServer(true)
        
        // data response handling by rxswift
        listingVM.dataArray.subscribe(onNext: { (data) in
            //XCTAssertTrue(!data.isEmpty)
        }).disposed(by: rxbag)
    }
}
