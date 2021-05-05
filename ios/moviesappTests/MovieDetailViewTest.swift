//
//  MovieDetailViewTest.swift
//  moviesappTests
//
//  Created by mateus.santos on 03/05/21.
//

import XCTest
import FBSnapshotTestCase
@testable import Runner

class MovieDetailViewTest: FBSnapshotTestCase {
    var movieDetail: MovieDetailView!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        movieDetail = MovieDetailView(MovieFake1())
        movieDetail.translatesAutoresizingMaskIntoConstraints = false
        movieDetail.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        movieDetail.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    }
    
    override func tearDownWithError() throws {
        movieDetail = nil
        try super.tearDownWithError()
    }
    
    func testLaunch() {
        FBSnapshotVerifyView(movieDetail)
    }
}
