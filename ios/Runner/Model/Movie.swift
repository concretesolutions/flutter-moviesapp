//
//  Movie.swift
//  Runner
//
//  Created by mateus.santos on 27/04/21.
//

import Foundation

protocol Movie {
    var id:Int { get }
    var title:String { get }
    var overview:String { get }
    var poster:String { get }
    var releaseDate:String { get }
}

struct MovieElement:Movie {
    var id:Int
    var title:String
    var overview:String
    var poster:String
    var releaseDate:String
    
    init() {
        self.id = 0
        self.title = "ERROR"
        self.overview = "ERROR"
        self.poster = "ERROR"
        self.releaseDate = "ERROR"
    }
}
