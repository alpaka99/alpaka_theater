//
//  MovieData.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

struct MovieData: Codable {
    let title: String
    let backdrop_path: String?
    let id: Int
    let genre_ids: [Int]
    let overview: String
    let poster_path: String?
}
