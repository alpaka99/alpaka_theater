//
//  ImageData.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

struct ImageSearchResponse: Codable {
    let backdrops: [ImageData]
}

struct ImageData: Codable {
    let file_path: String
}
