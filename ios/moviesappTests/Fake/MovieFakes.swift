//
//  Movie.swift
//  moviesappTests
//
//  Created by mateus.santos on 27/04/21.
//

import XCTest
@testable import Runner

struct MovieFake1:Movie {
    var id:Int
    var title:String
    var overview:String
    var poster:String
    var releaseDate:String
    
    init() {
        self.id = 3
        self.title = "Spider Man"
        self.overview = "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual font?"
        self.poster = "ERROR"
        self.releaseDate = "2010"
    }
}
struct MovieFake2:Movie {
    var id:Int
    var title:String
    var overview:String
    var poster:String
    var releaseDate:String
    
    init() {
        self.id = 2
        self.title = "Rambo"
        self.overview = "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual font?"
        self.poster = "ERROR"
        self.releaseDate = "1993"
    }
}
struct MovieFake3:Movie {
    var id:Int
    var title:String
    var overview:String
    var poster:String
    var releaseDate:String
    
    init() {
        self.id = 3
        self.title = "Nárnia"
        self.overview = "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual font?"
        self.poster = "ERROR"
        self.releaseDate = "2005"
    }
}
