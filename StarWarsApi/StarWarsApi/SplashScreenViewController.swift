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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsImageView.image = #imageLiteral(resourceName: "StarWarsLogo")
        perform(#selector(showNavigation), with: nil, afterDelay: 5)
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
        
    @objc func showNavigation()  {
        performSegue(withIdentifier: "showNavigation", sender: self)
    }
    
    
    
    
}
