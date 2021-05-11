//
//  CRUD.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import RealmSwift

class CRUDRealm {
    let realm = try! Realm()
    
    var movies: Results<Movie>!
    
    func save(_ object:Movie){
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        do {
            try realm.write{
                realm.add(object)
            }
        } catch {
            print("Error in save method")
        }
    }
    
    func fetch() {
        movies = realm.objects(Movie.self)
    }
    
    func update(_ index:Int,_ newObject: Movie) {
        if let movie = movies?[index]{
            do {
                try realm.write{
                    movie.title = newObject.title ?? ""
                    movie.overview = newObject.overview ?? ""
                    movie.poster_path = newObject.poster_path ?? ""
                }
            } catch {
                print("Error in update method")
            }
        }
    }
    
    func delete(_ index:Int) {
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
