//
//  HelloWorldView.swift
//  moviesappTests
//
//  Created by mateus.santos on 29/04/21.
//

import Foundation
import XCTest
import FBSnapshotTestCase

@testable import Runner

class HelloWorldViewTest: FBSnapshotTestCase {
    var helloView: HelloWorldView!
    
    override func setUp() {
        super.setUp()
        recordMode = true
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        helloView = HelloWorldView()
        helloView.translatesAutoresizingMaskIntoConstraints = false
        helloView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        helloView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    }
    
    override func tearDownWithError() throws {
        helloView = nil
        try super.tearDownWithError()
    }
    
    func testLaunch() {
        FBSnapshotVerifyView(helloView)
    }
}

