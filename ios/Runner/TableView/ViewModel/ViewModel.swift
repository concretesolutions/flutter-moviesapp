//
//  ViewModel.swift
//  Runner
//
//  Created by mateus.santos on 27/04/21.
//

import Foundation

class ViewModel {
    
    var listMovie:[Movie] = []
    
    func configureCell(_ movie:Movie,_ cell:ListTableViewCell){
        cell.titleMovie.text = movie.title
        cell.sinopseMovie.text = movie.overview
        cell.yearMovie.text = movie.releaseDate
        //cell.imageViewMovie.image = //download of image
    }

    init(_ list:[Movie]) {
        self.listMovie = list
    }
}
