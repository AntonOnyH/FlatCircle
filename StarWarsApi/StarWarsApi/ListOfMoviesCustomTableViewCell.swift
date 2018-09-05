//
//  ListOfMoviesCustomTableViewCell.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/04.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class ListOfMoviesCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmTitles: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var directors: UILabel!
    @IBOutlet weak var producers: UILabel!
    
    @IBOutlet weak var filmImage: UIImageView!
    
    var movieDetails: CellDetailsForMovies
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        filmTitles.text = movieDetails.filmTitle
        releaseDate.text = movieDetails.releaseDate
        directors.text = movieDetails.directors
        producers.text = movieDetails.producers
//        filmImage.image = movieDetails.filmImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
