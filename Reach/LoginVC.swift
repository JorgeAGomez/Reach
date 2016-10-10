//
//  LoginVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-14.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit


class LoginVC : UIViewController {

  @IBOutlet weak var facebookButton: UIButton!
  
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  let reachColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 67/251, alpha: 1.0).cgColor
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Reach"
    //self.navigationController?.isNavigationBarHidden = true
    loginButton.layer.borderColor = reachColor
    self.hideKeyboardWhenTappedAround()
    
  
  }

  override func viewDidAppear(_ animated: Bool) {
      self.tabBarController?.title = "Login"
      
  }
  //Create user or sign in using Facebook SDK. 
  
  @IBAction func facebookButtonTapped(_ sender: AnyObject) {
   
       let facebookLogin = FBSDKLoginManager()
    
       facebookLogin.logIn(withReadPermissions: ["email","public_profile"], from: self) { (result, error) in
        if error != nil
        {
          print("Unable to authenticate with facebok!")
        }
        else if result?.isCancelled == true{
          print("User cancelled facebook authentication")
        }
        else{
          print("Successfull authentication with Facebook",terminator:" ")
          let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
          
          self.firebaseAuth(credential)
          self.performSegue(withIdentifier: "login", sender: self)
        }
    }
  }

  func firebaseAuth(_ credential : FIRAuthCredential){
    FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
      if error != nil{
        print("Unable to authenticate with Firebase")
      }
      else{
        print("Successfull authentication with Firebase")
        
      }
    })
    
  }
  
  let providers = [String]()
  
  @IBAction func loginTapped(_ sender: AnyObject) {
    if let useremail = usernameTextField.text, let pwd = passwordTextField.text {
        FIRAuth.auth()?.signIn(withEmail: useremail, password: pwd) {(user, error )in
          if(error == nil){
              self.performSegue(withIdentifier: "login", sender: self)
              print("JORGE: \(error)")
          }
          else{
              let alertController = UIAlertController(title: "Sorry", message: "\(error)", preferredStyle: .alert)
              let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
              // ...
              }
              alertController.addAction(OKAction)
              self.present(alertController, animated: true)
        }
      }
    }
    else{
        let alertController = UIAlertController(title: "Sorry", message: "Text field cannot be emtpy", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true)
    }
  }
}

