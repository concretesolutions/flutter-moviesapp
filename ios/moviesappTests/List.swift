//
//  List.swift
//  moviesappTests
//
//  Created by mateus.santos on 27/04/21.
//

import Foundation
import XCTest
import FBSnapshotTestCase

@testable import Runner

class List: FBSnapshotTestCase {
    var listView: ListMoviesView!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        listView = ListMoviesView(numberItens: 3, listMovie: [MovieFake1(),MovieFake2(),MovieFake3()])
        listView.translatesAutoresizingMaskIntoConstraints = false
        listView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        listView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    }
    
    override func tearDownWithError() throws {
        listView = nil
        try super.tearDownWithError()
    }
    
    func testLaunch() {
        FBSnapshotVerifyView(listView)
    }
}


