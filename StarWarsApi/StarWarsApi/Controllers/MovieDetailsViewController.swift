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
    @IBOutlet weak var listOfCharactersTV: UITextView!
    @IBOutlet weak var wordsTextField: UITextView!
    
    var detailForEachMovie: CellDetailsForMovie? 
    let parser = ParseMovieDetails()
    var contentPointOfAdjustment: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        wordsTextField.layer.cornerRadius = 12
        contentPointOfAdjustment = CGPoint(x: 0, y: 0)
        if let movieDetail = detailForEachMovie {
            parser.fetchMovieCharacters(charterURLs: movieDetail.character) { (characters, error) in
                guard let characters = characters else { return }
                var characterString: String = ""
                for character in characters {
                    characterString.append("\(character.name)-")
                }
                DispatchQueue.main.async {
                    self.listOfCharactersTV.text = characterString
                }
            }
        }
        titlelabel.text = detailForEachMovie?.title
        filmDate.text = detailForEachMovie?.releaseDate
        wordsTextField.text = detailForEachMovie?.openingCrawl
    }
}
