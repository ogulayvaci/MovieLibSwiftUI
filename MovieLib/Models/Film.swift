//
//  Film.swift
//  MovieLib
//
//  Created by Ogul Ayvaci on 17.01.2025.
//

import Foundation

struct Film: Codable{
    
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}


struct GelenFilmler: Codable{
    let films: [Film]
    
    private enum CodingKeys: String, CodingKey {
        case films = "Search"
    }
}
