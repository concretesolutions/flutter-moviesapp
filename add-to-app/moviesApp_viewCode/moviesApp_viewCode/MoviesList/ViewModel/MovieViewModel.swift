//
//  MovieViewModel.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

protocol DelegateViewModel:AnyObject{
    func notifyViewController()
}

class MovieViewModel{
    
    let client = APIClient()
    var movies:[Movie] = []
    
    weak var delegate:DelegateViewModel!
    
    init(_ delegate:DelegateViewModel) {
        self.delegate = delegate
    }
    
    func fetch(){
        client.fetch(1, .get) { [weak self] listaMovies in
            if let lista = listaMovies {
                self?.movies = lista
                self?.delegate.notifyViewController()
            } else {
                print("not found")
            }
        }
    }
    
    func numberOfItens() -> Int{
        return movies.count
    }
    
    func titleMovie(_ index:Int) -> String{
        return movies[index].title ?? "Error"
    }
    
    func getPathImage(_ index:Int) -> String? {
        return movies[index].poster_path ?? "Error"
    }
    
    func addDataCell(_ cell:MovieCollectionViewCell,_ index:Int) {
        cell.index = index
        cell.id = movies[index].id ?? 0
        cell.title = movies[index].title ?? "Error"
        cell.overview = movies[index].overview ?? "Error"
        cell.poster_path = movies[index].poster_path ?? "Error"
        cell.realease_date = movies[index].release_date ?? "Error"
    }
}

extension MovieViewModel:ObserverRequest {
    func notifyAll() {
      
    }
}
