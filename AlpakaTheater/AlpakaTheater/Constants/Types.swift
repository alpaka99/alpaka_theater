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
    
    
    var url: String {
        switch self {
        case .searchMovie(_):
            return "https://api.themoviedb.org/3/search/movie"
        case .similarMovies(let movieId):
            return "https://api.themoviedb.org/3/movie/\(movieId)/similar"
        case .recommendations(let movieId):
            return "https://api.themoviedb.org/3/movie/\(movieId)/recommendations"
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
            parameters["language"] = "en-US"
            parameters["page"] = "1"
        }
        
        return parameters
    }
}
