//
//  qa_guru_a3UITestsLaunchTests.swift
//  qa guru a3UITests
//
//  Created by vlad on 05.09.2023.
//

import XCTest

final class qa_guru_a3UITestsLaunchTests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func attachScreenshotToReport() {
        XCTContext.runActivity(named: "Attach Screenshot to Report") { activity in
            activity.add(takeFullScreenshot())
        }
    }
    
    func takeFullScreenshot() -> XCTAttachment {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.lifetime = .keepAlways
        return attachment
    }

    func testApp() throws {
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        app.buttons["example"].tap()
    }
    
    func testActivites() throws {

        XCTContext.runActivity(named: "Launch App") { activity in
            app.launch()
        }
        
        XCTContext.runActivity(named: "Launch App") { activity in
            app.buttons["example"].tap()
        }
        
    }
    
    func testFail() throws {
        app.launch()
        XCTFail("Failure from test")
    }
    
    func testExampleTestops() throws {
        testOpsId(1)
        
        step("Запуск приложения") {
            app.launch()
        }

    }
}
