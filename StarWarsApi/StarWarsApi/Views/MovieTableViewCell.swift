//
//  MovieTableViewCell.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/06.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var filmImageView: UIImageView!
        @IBOutlet weak var filmTitles: UILabel!
        @IBOutlet weak var releaseDate: UILabel!
        @IBOutlet weak var directors: UILabel!
        @IBOutlet weak var producers: UILabel!

    func configure(with movie: CellDetailsForMovie) {
        filmTitles.text = movie.title
        releaseDate.text = movie.releaseDate
        directors.text = movie.director
        producers.text = movie.producer
    }
}
