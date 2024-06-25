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
    
    func fetchTMDBData(_ tmdbRequestType: TMDBRequestType) {
        let url = tmdbRequestType.url
        
        let parameters: Parameters = tmdbRequestType.parameters
        
        let headers = TMDBAPIKey.headers
        
        AF.request(
            url,
            parameters: parameters,
            headers: headers
        )
        .responseDecodable(of: TMDBResponse.self) { response in
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
