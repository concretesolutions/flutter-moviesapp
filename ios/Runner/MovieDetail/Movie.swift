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
}
