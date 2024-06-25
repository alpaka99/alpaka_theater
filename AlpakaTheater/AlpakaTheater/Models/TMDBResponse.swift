//
//  TMDBResponse.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

struct TMDBResponse: Codable {
    let page: Int
    let results: [MovieData]
    let total_pages: Int
    let total_results: Int
}

struct MovieData: Codable {
    let backdrop_path: String
    let genre_ids: [Int]
    let original_language: String
    let original_title: String
    let overview: String
    let poster_path: String
}
