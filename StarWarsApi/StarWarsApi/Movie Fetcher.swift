//
//  Movie Fetcher.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/05.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import UIKit


struct CellDetailsForMovies: Codable {
    var filmTitle: String
    var releaseDate: String
    var directors: String
    var producers: String
    var filmImage: String
}

class ParseMovieDetails {
   
    
    
    let baseURL = URL(string: "GET https://api.nasa.gov/planetary/apod")!
    
    let query: [String: String] = ["api_key": "DEMO_KEY",]
    let task = URLSession.shared.dataTask(with: url) {(data, response, error)
        in
        if let data = data,
            let string = String(data: data, encoding: .utf8){
            print(string)
            
        }
        
    }
    
    task.resume()
}

