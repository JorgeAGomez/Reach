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
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    override func viewDidAppear(_ animated: Bool) {
      //super.viewDidAppear(true)
      self.tabBarController?.title = "Home"
      self.tabBarController?.navigationItem.rightBarButtonItem = nil
      
}
    

}
