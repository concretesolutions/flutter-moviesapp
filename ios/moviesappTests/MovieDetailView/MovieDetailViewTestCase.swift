//
//  MovieDetailViewTestCase.swift
//  moviesappTests
//
//  Created by Matheus de Vasconcelos on 05/05/21.
//

import XCTest
import FBSnapshotTestCase
@testable import Runner

class MovieDetailViewTestCase: FBSnapshotTestCase {

    var sut: MovieDetailView!

    override func setUp() {
        super.setUp()
        sut = MovieDetailView(frame: UIScreen.main.bounds)
        recordMode = false
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViews() {
        sut.bind(movie: .dummy)
        FBSnapshotVerifyView(sut)
    }

}
