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
    
    
    var details : CellDetailsForMovie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlelabel.text = details?.title
        filmDate.text = details?.releaseDate
//        characterNamesLabel.text =
        wordsTextField.text = details?.openingCrawl
    }

   
    

  
    
    

}
