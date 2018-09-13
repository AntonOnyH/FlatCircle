//
//  parsingObjects.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/13.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation

struct CellDetailsForMovie: Decodable {
    var title: String
    var releaseDate: String
    var director: String
    var producer: String
    var character: [String]
    var openingCrawl: String
    
}

extension CellDetailsForMovie {
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case releaseDate = "release_date"
        case director = "director"
        case producer = "producer"
        case character = "characters"
        case openingCrawl = "opening_crawl"
    }
}
struct MovieCharacter: Decodable {
    let name: String
}

struct StarWarsFilms: Decodable {
    let movies: [CellDetailsForMovie]
}
extension StarWarsFilms{
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
