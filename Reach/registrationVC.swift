//
//  registrationVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import Eureka
import FirebaseAuth

class registrationVC: FormViewController {

  let firstNameTag = "firstNameTag"
  let lastNameTag = "lastNameTag"
  let dobTag = "dobTag"
  let phoneNumberTag = "phoneNumberTag"
  let emailTag = "emailTag"
  let passwordTag = "passwordTag"



    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DoneTapped))
        self.navigationItem.rightBarButtonItem = rightButton
                //Sets the navigation bar title
        self.title = "New User"
        
      
      
        //Eureka framework to create forms.
        form
          +++ Section("User information")
          //FIRST NAME
            <<< TextRow(firstNameTag){ titleRow in
                titleRow.title = "First Name"
                titleRow.placeholder = "Enter your first name"
            }
          //LAST NAME
            <<< TextRow(lastNameTag){ descriptionRow in
              descriptionRow.title = "Last Name"
              descriptionRow.placeholder = "Enter your last name"
            }
          //EMAIL
            <<< EmailRow(emailTag){ emailRow in
              emailRow.title = "Email"
              emailRow.placeholder = "example@gmail.com"
            }
          //PASSWORD
            <<< PasswordRow(passwordTag){ passwRow in
              passwRow.title = "Password"
              passwRow.placeholder = "Enter your password"
            
            }
          //BIRTHDATE
            <<< DateRow(dobTag){
              $0.title = "Birthday"
              $0.value = NSDate() as Date
            }
          //PHONE NUMBER
            <<< PhoneRow(phoneNumberTag){
                $0.title = "Phone number"
                $0.placeholder = "(123)4567891"
            }
          //WORK EXPERIENCE / SKILLS
        +++ Section("Profession / Expertise")
            <<< TextRow("Skills"){ skillRow in
                skillRow.title = "Skill(s)"
                skillRow.placeholder = "What do you do?"
            }
          //DATE
            <<< DateRow("toDateTag"){
              $0.title = "To"
              $0.value = NSDate() as Date
            }
    }

    func DoneTapped(){
        let email: EmailRow? = form.rowBy(tag: emailTag)
        let value = email?.value
      
        let password: PasswordRow? = form.rowBy(tag: passwordTag)
        let value2 = password?.value
      
        FIRAuth.auth()?.createUser(withEmail: value!, password: value2!, completion: { (user, error) in
        if(error == nil) {
          self.performSegue(withIdentifier: "userCreated", sender: self)
        }
      })

    }
  
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  

}
