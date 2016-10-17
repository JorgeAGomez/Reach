//
//  WelcomeVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-10-09.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

class WelcomeVC: UIViewController {

  @IBOutlet weak var signUpButton: UIButton!
  
  @IBOutlet weak var logInButton: UIButton!
  
  let reachColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 67/251, alpha: 1.0).cgColor
  override func viewDidLoad() {
      super.viewDidLoad()
      signUpButton.layer.borderColor = reachColor
      logInButton.layer.borderColor = reachColor
      if let user_token = FBSDKAccessToken.current() {
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: user_token.tokenString)
            self.firebaseAuth(credential)
            let tabBarViewC = TabBarVC.storyboardInstance()
            self.navigationController?.pushViewController(tabBarViewC!, animated: true)
      }
  }
    
  @IBAction func signUpTapped(_ sender: AnyObject) {
    let registrationViewC = SignUpVC.storyboardInstance()
    navigationController?.pushViewController(registrationViewC!, animated: true)
  }

  @IBAction func logInTapped(_ sender: AnyObject) {
    let loginViewC = LoginVC.storyboardInstance()
    navigationController?.pushViewController(loginViewC!, animated: true)
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
  
  static func storyboardInstance() -> WelcomeVC? {
    let storyboard = UIStoryboard(name: "WelcomeVC", bundle: nil)
    return storyboard.instantiateInitialViewController() as? WelcomeVC
  }

}
