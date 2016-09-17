//
//  ProfileVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {

  @IBOutlet weak var profilePicture: UIImageView!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var professionName: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //Adding title and rightButton to navigationBar.
        self.tabBarController?.title = "Profile"
        let rightButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButton))
        rightButton.tintColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 67/251, alpha: 1.0)
        self.tabBarController?.navigationItem.rightBarButtonItem = rightButton
      
        //Modifies the radius of the square to make the profile picture a circle.
        profilePicture.layer.cornerRadius = 75
        profilePicture.layer.borderWidth = 3
        profilePicture.layer.borderColor = UIColor(displayP3Red: 211/251, green: 81/251, blue: 66/251, alpha: 1.0).cgColor
        profilePicture.clipsToBounds = true
      
    }
  
    func logoutButton(){
        try! FIRAuth.auth()!.signOut()
        let loginViewController = self.storyboard!.instantiateViewController(withIdentifier: "loginScreen")
        UIApplication.shared.keyWindow?.rootViewController = loginViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
