//
//  FlashScreenViewController.swift
//  StarWarsApi
//
//  Created by Anton Huisamen on 2018/09/04.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class FlashScreenViewController: UIViewController {
    
    @IBOutlet weak var starWarsImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
starWarsImageView.image = #imageLiteral(resourceName: "StarWarsLogo")
    }

    
    

    

}
