//
//  LoginVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-14.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginVC : UIViewController {

  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var signUpButton: UIButton!
  
  let reachColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 67/251, alpha: 1.0).cgColor
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Reach"
    loginButton.layer.borderColor = reachColor
    signUpButton.layer.borderColor = reachColor
  
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func loginTapped(_ sender: AnyObject) {
    FIRAuth.auth()?.signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) {(user, error )in
      if(error == nil){
          self.performSegue(withIdentifier: "login", sender: self)
      }
      else{
        print("THIS IS THE ERROR: \(error)")
      }
    }
  }
}

