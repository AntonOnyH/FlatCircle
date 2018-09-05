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
    
    var movieDetails: CellDetailsForMovie?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with movie: CellDetailsForMovie) {
                filmTitles.text = movie.title
                releaseDate.text = movie.releaseDate
                directors.text = movie.director
                producers.text = movie.producer
                filmImage.image = #imageLiteral(resourceName: "placeholder")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
