//
//  searchJobFormVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import Eureka

class searchJobFormVC: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
        self.tabBarController?.title = "Search"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
