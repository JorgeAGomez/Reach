//
//  WelcomeVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-10-09.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

  @IBOutlet weak var signUpButton: UIButton!
  
  @IBOutlet weak var logInButton: UIButton!
  
  let reachColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 67/251, alpha: 1.0).cgColor
  override func viewDidLoad() {
      super.viewDidLoad()
      signUpButton.layer.borderColor = reachColor
      logInButton.layer.borderColor = reachColor
      signUpButton.layer.backgroundColor = reachColor
      logInButton.layer.backgroundColor = reachColor

  }
    
  @IBAction func signUpTapped(_ sender: AnyObject) {
    let registrationViewC = SignUpVC.storyboardInstance()
    navigationController?.pushViewController(registrationViewC!, animated: true)
  }

  @IBAction func logInTapped(_ sender: AnyObject) {
    let loginViewC = LoginVC.storyboardInstance()
    navigationController?.pushViewController(loginViewC!, animated: true)
  }

}
