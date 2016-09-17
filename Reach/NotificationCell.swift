//
//  NotificationCell.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

  @IBOutlet weak var userImage: UIImageView!
  @IBOutlet weak var message: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
