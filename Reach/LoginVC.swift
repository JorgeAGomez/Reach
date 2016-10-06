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
    self.navigationController?.isNavigationBarHidden = true
    loginButton.layer.borderColor = reachColor
    self.hideKeyboardWhenTappedAround()
    
  
  }

  override func viewDidAppear(_ animated: Bool) {
      self.tabBarController?.title = "Login"
      
  }
  @IBAction func facebookButtonTapped(_ sender: AnyObject) {
   
       let facebookLogin = FBSDKLoginManager()
    
       facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
        if error != nil
        {
          print("Unable to authenticate with facebok!")
        }
        else if result?.isCancelled == true{
          print("User cancelled facebook authentication")
        }
        else{
          print("Facebook Authe Successfull")
          let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
          self.firebaseAuth(credential)
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
  
  @IBAction func loginTapped(_ sender: AnyObject) {
    FIRAuth.auth()?.signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) {(user, error )in
      if(error == nil){
          self.performSegue(withIdentifier: "login", sender: self)
      }
      else{
        let alertController = UIAlertController(title: "Try Again!", message: "The username or password is not correct", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
      }
    }
  }
}

