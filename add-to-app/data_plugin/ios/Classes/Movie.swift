//
//  Movie.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift

class Movie:Object {
    @objc dynamic var title:String = ""
    @objc dynamic var overview:String = ""
    @objc dynamic var poster_path:String = ""
    
}

