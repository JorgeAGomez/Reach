//
//  ProfileVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

class ProfileVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var profilePicture: UIImageView!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var professionName: UILabel!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var tableView: UITableView!
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
      return UITableViewCell()
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
      
        //Modifies the radius of the square to make the profile picture a circle.
        profilePicture.layer.cornerRadius = 75
        profilePicture.layer.borderWidth = 1.5
        profilePicture.layer.borderColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 66/251, alpha: 1.0).cgColor
        profilePicture.clipsToBounds = true
    }
  
    override func viewDidAppear(_ animated: Bool) {
      //Adding title and rightButton to navigationBar.
      let rightButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButton))
      rightButton.tintColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 67/251, alpha: 1.0)
        self.tabBarController?.navigationItem.rightBarButtonItem = rightButton

      self.tabBarController?.title = "Profile"
      self.tabBarController?.navigationItem.rightBarButtonItem = rightButton
    }
  
    override func viewWillDisappear(_ animated: Bool) {
      self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
  
    func logoutButton(){
        try! FIRAuth.auth()!.signOut()
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        let login = LoginVC.storyboardInstance()
        
        self.navigationController?.show(login!, sender: self)
    }

}

  extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
}
