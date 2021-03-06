//
//  ListOfMoviesTableViewController.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/05.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class ListOfMoviesTableViewController: UITableViewController {
    
    let images = [#imageLiteral(resourceName: "StarWarsEp1"), #imageLiteral(resourceName: "StarWarsEp2"), #imageLiteral(resourceName: "StarWarsEp3"), #imageLiteral(resourceName: "StarWarsEp4"), #imageLiteral(resourceName: "StarWarsEp5"), #imageLiteral(resourceName: "StarwarsEp6"), #imageLiteral(resourceName: "StarwarsEP7")]
    var starWarsMovies: StarWarsFilms?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "StarWars Movies"
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.items = nil
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsMovies?.movies.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        cell.filmImageView.image = nil
        
        if let movies = starWarsMovies?.movies[indexPath.row]{
            cell.configure(with: movies)
        }
        cell.filmImageView.image = images[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = starWarsMovies?.movies[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetailsViewController
        controller.detailForEachMovie = movie
        navigationController?.pushViewController(controller, animated: true)
    }
  
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.lightGray
//
//        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
//            tableView.bounds.size.width, height: tableView.bounds.size.height))
//        headerLabel.font = UIFont(name: "SFDistantGalaxyAlternate", size: 30)
//        headerLabel.textColor = UIColor.black
//        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
//        headerView.addSubview(headerLabel)
//
//        return headerView
//    }
}
