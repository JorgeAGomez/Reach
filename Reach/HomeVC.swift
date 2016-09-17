//
//  HomeVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-14.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
        self.tabBarController?.title = "Home"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
