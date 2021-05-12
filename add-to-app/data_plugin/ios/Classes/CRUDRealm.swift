//
//  CRUD.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift

public class CRUDRealm {
    let realm = try! Realm()
    
    public var movies: Results<MovieObject>!

    public init(){

    }
    
    public func save(_ object:MovieObject) -> Bool{
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        do {
            try realm.write{
                realm.add(object)
            }
            return true
        } catch {
            print("Error in save method")
            return false
        }
    }
    
    public func fetch() {
        movies = realm.objects(MovieObject.self)
    }
    
    public func update(_ index:Int,_ newObject: MovieObject) {
        if let movie = movies?[index]{
            do {
                try realm.write{
                    movie.title = newObject.title
                    movie.overview = newObject.overview
                    movie.poster_path = newObject.poster_path
                }
            } catch {
                print("Error in update method")
            }
        }
    }
    
    public func delete(_ index:Int) {
        if let movie = movies?[index]{
            do {
                try realm.write{
                    realm.delete(movie)
                }
            } catch {
                print("Error in update method")
            }
        }
    }
}
