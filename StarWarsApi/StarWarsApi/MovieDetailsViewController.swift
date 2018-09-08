//
//  MovieDetailsViewController.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/04.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var filmDate: UILabel!
    @IBOutlet weak var characterNamesLabel: UILabel!
    @IBOutlet weak var wordsTextField: UITextView!
    
    
    var details: CellDetailsForMovie? 
    let parser = ParseMovieDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieDetail = details {
            parser.fetchMovieCharacters(chartersURLs: movieDetail.character) { (characters, error) in
                guard let characters = characters else { return }
                var characterString: String = ""
                
                for character in characters {
                    characterString.append("\(character.name), ")
                }
                DispatchQueue.main.async {
                    self.characterNamesLabel.text = characterString
                }
            }
        }
        
        titlelabel.text = details?.title
        filmDate.text = details?.releaseDate
        wordsTextField.text = details?.openingCrawl
    }

   
    

  
    
    

}
