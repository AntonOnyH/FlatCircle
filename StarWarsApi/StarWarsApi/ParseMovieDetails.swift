//
//  File.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/05.
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


class ParseMovieDetails {

    
    func fetchMovieData(completion: @escaping (_ movieData: StarWarsFilms?, _ error: Error?) -> Void) {
        let baseURL = URL(string: "https://swapi.co/api/films/")!
        let task = URLSession.shared.dataTask(with: baseURL) {(data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let movieData = try decoder.decode(StarWarsFilms.self, from: data)
                completion(movieData, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func fetchMovieCharacters(charterURLs: [String], completion: @escaping (_ arrayOfCharacters: [MovieCharacter]?, _ error: Error?) -> Void) {
        var arrayOfMovieCharacters: [MovieCharacter] = []
        
        for characterURL in charterURLs {
            let url = URL(string: characterURL)
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                guard let data = data else {return}
                do {
                    let decoder = JSONDecoder()
                    let movieCharacter = try decoder.decode(MovieCharacter.self, from: data)
                    arrayOfMovieCharacters.append(movieCharacter)
                    if arrayOfMovieCharacters.count == charterURLs.count {
                        completion(arrayOfMovieCharacters, nil)
                    }
                }
                catch {
                    completion(nil, error)
                    return
                }
            }
            task.resume()
        }
    }
}

