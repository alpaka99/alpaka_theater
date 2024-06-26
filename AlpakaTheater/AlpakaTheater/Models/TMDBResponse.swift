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
