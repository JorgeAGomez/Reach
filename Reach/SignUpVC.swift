//
//  SignUpVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-10-14.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import FirebaseAuth
import TextFieldEffects

class SignUpVC: UIViewController {

  @IBOutlet weak var emailTextField: YoshikoTextField!
  @IBOutlet weak var FirstNameTextField: YoshikoTextField!
  @IBOutlet weak var lastNameTextField: YoshikoTextField!
  @IBOutlet weak var passwordTextField: YoshikoTextField!


  override func viewDidLoad() {
        super.viewDidLoad()
                self.title = "Sign up"
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
  }

  static func storyboardInstance() -> SignUpVC? {
    let storyboard = UIStoryboard(name: String(describing: self) , bundle: nil)
    return storyboard.instantiateInitialViewController() as? SignUpVC
  }
  
    @IBAction func signUpTapped(_ sender: AnyObject) {
    if let email = emailTextField.text, let pwd = passwordTextField.text {
      FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
        if(error == nil) {
          self.performSegue(withIdentifier: "userCreated", sender: self)
        }
        else{
          let alertController = UIAlertController(title: "Sorry", message: "Please enter email and password", preferredStyle: .alert)
          let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
          // ...
          }
          alertController.addAction(OKAction)
          self.present(alertController, animated: true)
        }
        })
    }
  }
  
  
  @IBAction func signUpFacebookButton(_ sender: AnyObject) {
  }
    
  @IBAction func signUpGoogleButton(_ sender: AnyObject) {
  }


}
