//
//  DogUITests.swift
//  DogUITests
//
//  Created by Rahul Mayani on 14/04/21.
//

import XCTest

class DogUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testScrollTable() {
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.element(boundBy: 0)
        let lastCell = table.cells.element(boundBy: table.cells.count-1)
        table.scrollToElement(lastCell)
        
        XCTAssertTrue(app.staticTexts["13 - 14 years"].exists)
    }
    
    // Sorting UI testing
    func testSortingButtonTapping() {
        let app = XCUIApplication()
        app.launch()
        
        let sortButton = app.navigationBars["The Dog"].buttons["Sort"]
        sortButton.tap()
        
        let elementsQuery = app.sheets.scrollViews.otherElements
        elementsQuery.buttons["Ascending"].tap()
    }
}

// Visible element swipe
extension XCUIElement {

    func scrollToElement(_ element: XCUIElement) {
        while !element.visible() {
            swipeUp()
        }
    }

    func visible() -> Bool {
        guard self.exists && !self.frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
}
