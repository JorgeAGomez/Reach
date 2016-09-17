//
//  postJobFormVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit
import Eureka

class postJobFormVC: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         form
          +++ Section("Job information")
            <<< TextRow("titleTag"){ titleRow in
                titleRow.title = "Title"
                titleRow.placeholder = "Enter title here"
            }
          
            <<< TextRow("descriptionTag"){ descriptionRow in
              descriptionRow.title = "Description"
              descriptionRow.placeholder = "e.g build a mobile app"
            }
          
            <<< TextRow("budgetTag"){ budgetRow in
              budgetRow.title = "Budget"
              budgetRow.placeholder = "$$$"
              
            }
          
            <<< PhoneRow("phoneTag"){
                $0.title = "Phone number"
                $0.placeholder = "(123)4567891"
            }
          
        +++ Section("When")
            <<< DateRow("fromDateTag"){
                $0.title = "From"
                $0.value = NSDate() as Date
            }
            <<< DateRow("toDateTag"){
              $0.title = "To"
              $0.value = NSDate() as Date
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
