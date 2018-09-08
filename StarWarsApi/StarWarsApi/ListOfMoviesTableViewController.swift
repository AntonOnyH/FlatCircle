//
//  ListOfMoviesTableViewController.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/05.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class ListOfMoviesTableViewController: UITableViewController {
    
    let fetchMovieDetails = ParseMovieDetails()
    let images = [#imageLiteral(resourceName: "StarWarsEp1"), #imageLiteral(resourceName: "StarWarsEp2"), #imageLiteral(resourceName: "StarWarsEp3"), #imageLiteral(resourceName: "StarWarsEp4"), #imageLiteral(resourceName: "StarWarsEp5"), #imageLiteral(resourceName: "StarwarsEp6"), #imageLiteral(resourceName: "StarwarsEP7")]

    
    var movies: StarWarsFilms? {
        didSet {
            DispatchQueue.main.async {
               self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovieDetails.fetchMovieData { (movies, error) in
            if let movieData = movies {
                self.movies = movieData
            }
        }
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")

    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.movies.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        cell.filmImageView.image = nil
        
        if let movies = movies?.movies[indexPath.row]{
         cell.configure(with: movies)
        }
        cell.filmImageView.image = images[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies?.movies[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetailsViewController
        controller.details = movie
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
