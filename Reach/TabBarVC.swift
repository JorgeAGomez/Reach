//
//  TabBarVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-14.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }

  static func storyboardInstance() -> TabBarVC? {
    let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
    return storyboard.instantiateInitialViewController() as? TabBarVC
  }



}
