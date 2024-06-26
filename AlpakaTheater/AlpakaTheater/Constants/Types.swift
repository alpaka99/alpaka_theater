//
//  Types.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import Alamofire

enum TMDBRequestType: Hashable {
    case searchMovie(String)
    case similarMovies(Int)
    case recommendations(Int)
    case images(Int)
    
    
    var baseUrl: String {
        switch self {
        case .searchMovie(_):
            return "https://api.themoviedb.org/3/search/movie"
        case .similarMovies(let movieId):
            return "https://api.themoviedb.org/3/movie/\(movieId)/similar"
        case .recommendations(let movieId):
            return "https://api.themoviedb.org/3/movie/\(movieId)/recommendations"
        case .images(let movieId):
            return  "https://api.themoviedb.org/3/movie/\(movieId)/images"
        }
    }
    
    var parameters: Parameters {
        var parameters: Parameters = [:]
        
        switch self {
        case .searchMovie(let movieName):
            parameters["query"] = movieName
            parameters["include_adults"] = "false"
            parameters["language"] = "ko-KR"
            parameters["page"] = "1"
        case .similarMovies(_), .recommendations(_):
            parameters["language"] = "ko-KR"
            parameters["page"] = "1"
        case .images(_):
            break
        }
        return parameters
    }
}
