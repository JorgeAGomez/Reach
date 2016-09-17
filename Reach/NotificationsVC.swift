//
//  NotificationsVC.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit

class NotificationsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
        //self.tabBarController?.title = "Notifications"
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NotificationCell
    
    cell.userImage.layer.cornerRadius = 20
    cell.userImage.clipsToBounds = true
    cell.message.text = "New job posted near you."
    
    
    return cell
  }

}
