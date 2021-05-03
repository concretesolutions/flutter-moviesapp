//
//  moviesappTests.swift
//  moviesappTests
//
//  Created by mateus.santos on 27/04/21.
//

import XCTest
import FBSnapshotTestCase

@testable import Runner

class TestCell: FBSnapshotTestCase {
    var listTableViewCell: ListTableViewCell!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let cell = ListTableViewCell(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: 400))
        listTableViewCell = cell
        let movie = MovieFake1()
        listTableViewCell.titleMovie.text = movie.title
        listTableViewCell.sinopseMovie.text = movie.overview
        listTableViewCell.yearMovie.text = movie.releaseDate
        
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        listTableViewCell = nil
    }
    
    func testLaunch() {
        FBSnapshotVerifyView(listTableViewCell)
    }
}


