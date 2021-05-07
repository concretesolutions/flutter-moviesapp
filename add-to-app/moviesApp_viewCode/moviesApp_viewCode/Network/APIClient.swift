//
//  APIClient.swift
//  moviesApp_viewCode
//
//  Created by mateus.santos on 06/05/21.
//

import Alamofire

class APIClient{
    private var baseURL:String = "https://api.themoviedb.org/3/"
    private var path:String = "movie/popular"
    private var apiKey:String = "api_key=2852a7a7b179338b2b037c9b555a69da"

    var request:APIRequest?
    
    init() {
        request = APIRequest()
    }
    
    func fetch(_ page:Int,_ method:HTTPMethod, completion: @escaping ([Movie]?) -> Void){
        let url = "\(baseURL)\(path)?\(apiKey)&page=\(page)"
        
        request?.request(url, .get, completion: { listMovie,error  in
            if error == nil {
                completion(listMovie ?? [])
            }
        })
    }
}
