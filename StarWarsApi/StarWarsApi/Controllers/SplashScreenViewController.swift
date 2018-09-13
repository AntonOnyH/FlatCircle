//
//  FlashScreenViewController.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/04.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var starWarsImageView: UIImageView!
    let fetchMovieDetails = ParseMovieDetails()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        starWarsImageView.image = #imageLiteral(resourceName: "StarWarsLogo")
        fetchMovieDetails.fetchMovieData { (movies, error) in
            if let movieData = movies {
                DispatchQueue.main.async {
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListOfMoviesTableViewController")
                        as! ListOfMoviesTableViewController
                    vc.starWarsMovies = movieData
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
