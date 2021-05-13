//
//  Movie.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift

public class MovieObject:Object {
    @objc public dynamic var id:Int = 0
    @objc public  dynamic var title:String = ""
    @objc public dynamic var overview:String = ""
    @objc public dynamic var poster_path:String = ""
    @objc public dynamic var release_date:String = ""
    
}

