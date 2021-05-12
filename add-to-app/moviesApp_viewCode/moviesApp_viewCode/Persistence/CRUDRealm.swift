//
//  CRUD.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift
import data_plugin


class CRUD{
    func save(_ object: MovieObject) -> Bool{
        let crudRealm = CRUDRealm()
        let result = crudRealm.save(object)
        return result
    }
    
    func fetch() -> [MovieObject] {
        let crudRealm = CRUDRealm()
        crudRealm.fetch()
        return Array(crudRealm.movies)
    }
}
