//
//  Movie.swift
//  Runner
//
//  Created by Matheus de Vasconcelos on 05/05/21.
//

import Foundation

internal struct Movie: Decodable {
    internal let title: String
    internal let description: String
    internal let coverURL: URL
    internal let releaseDate: String

    internal init?(dict: Dictionary<String, Any>) {
        guard let title = dict["title"] as? String,
              let description = dict["overview"] as? String,
              let posterPath = dict["poster_path"] as? String,
              let posterPathURL = URL(string: "https://image.tmdb.org/t/p/w154/\(posterPath)"),
              let releaseDate = dict["release_date"] as? String else {
            return nil
        }
        self.title = title
        self.description = description
        self.coverURL = posterPathURL
        self.releaseDate = releaseDate
    }

}
