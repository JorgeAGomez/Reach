//
//  SearchVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-19.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    override func viewDidAppear(_ animated: Bool) {
      
      self.tabBarController?.title = "Search"
      self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }

}
