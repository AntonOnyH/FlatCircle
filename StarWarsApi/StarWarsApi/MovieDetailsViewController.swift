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
    @IBOutlet weak var listOfCharactersTextField: UITextField!
    @IBOutlet weak var wordsTextField: UITextView!
    
    
    var details: CellDetailsForMovie? 
    let parser = ParseMovieDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        wordsTextField.layer.cornerRadius = 12
        
        if let movieDetail = details {
            parser.fetchMovieCharacters(charterURLs: movieDetail.character) { (characters, error) in
                guard let characters = characters else { return }
                var characterString: String = ""
                
                for character in characters {
                    characterString.append("\(character.name), ")
                }
                DispatchQueue.main.async {
                    self.listOfCharactersTextField.text = characterString
                }
            }
        }
        
        titlelabel.text = details?.title
        filmDate.text = details?.releaseDate
        wordsTextField.text = details?.openingCrawl
    }

   
    

  
    
    

}
