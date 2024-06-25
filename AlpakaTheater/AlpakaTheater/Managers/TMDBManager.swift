//
//  TMDBManager.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//
import Alamofire

final class TMDBManager {
    static let shared = TMDBManager()
    
    private init () { }
    
    
    func fetchTMDBData() {
        let url = "https://api.themoviedb.org/3/trending/movie/day"
        
        let parameters: Parameters = [
            "language" : "en-US"
        ]
        
        let headers = TMDBAPIKey.headers
        
        AF.request(
            url,
            parameters: parameters,
            headers: headers
        )
        .responseString { response in
            switch response.result {
            case .success(let value):
                dump(value)
            case .failure(let error):
                print("ERROR")
                print(error.localizedDescription)
            }
        }
    }
}
