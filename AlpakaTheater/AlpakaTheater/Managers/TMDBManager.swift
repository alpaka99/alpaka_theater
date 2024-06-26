//
//  TMDBManager.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//
import UIKit

import Alamofire
import Kingfisher

final class TMDBManager {
    static let shared = TMDBManager()
    
    private init () { }
    
    func fetchTMDBData<T: Codable>(
        _ tmdbRequestType: TMDBRequestType,
        _ type: T.Type,
        completionHandler: @escaping (T) -> ()
    ) { 
        AF.request(
            tmdbRequestType.baseUrl,
            parameters: tmdbRequestType.parameters,
            headers: TMDBAPIKey.headers
        )
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print("ERROR")
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchImage(_ imageURL: String, completionHandler: @escaping (UIImage) -> ()) {
        if let url = URL(string: TMDBAPIKey.imageURLPrefix + imageURL) {
            KingfisherManager.shared.retrieveImage(with: url) { kingFisherResponse in
                switch kingFisherResponse {
                case .success(let retrieveImageResult):
                    completionHandler(retrieveImageResult.image)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
