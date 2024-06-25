//
//  Types.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import Alamofire

enum TMDBRequestType {
    case searchMovie(String)
    
    var url: String {
        switch self {
        case .searchMovie(_):
            "https://api.themoviedb.org/3/search/movie"
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
        }
        
        return parameters
    }
}
