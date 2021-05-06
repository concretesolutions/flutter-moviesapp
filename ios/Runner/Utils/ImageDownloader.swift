//
//  ImageDownloader.swift
//  Runner
//
//  Created by Matheus de Vasconcelos on 05/05/21.
//

import Foundation

internal enum RequestError: Error {
    case noData
    case noImage
}

internal class ImageDownloader {

    internal let client: URLSession

    internal init(client: URLSession = URLSession.shared) {
        self.client = client
    }

    internal func download(url: URL, result: @escaping (Result<UIImage, Error>) -> Void) {
        client.dataTask(with: URLRequest(url: url)) { (imageData, response, error) in
            guard let data = imageData else {
                return result(.failure(RequestError.noData))
            }
            guard let image = UIImage(data: data) else {
                return result(.failure(RequestError.noImage))
            }
            result(.success(image))
        }.resume()
    }

}
