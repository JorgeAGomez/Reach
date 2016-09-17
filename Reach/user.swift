//
//  user.swift
//  Reach
//
//  Created by Jorge Gomez on 2016-09-15.
//  Copyright © 2016 Jorge Gomez. All rights reserved.
//

import Foundation

class User{

  private var _firstName: String
  private var _lastName: String
  private var _birthday: NSDate
  
  var firstName: String {
    return _firstName
  }
  
  var lastName: String{
    return _lastName
  }
  
  var birthday: NSDate {
    return _birthday
  }
  
  var fullName: String {
    return "\(_firstName) \(_lastName)"
  }
  
  
  init(firstName: String, lastName: String, DOB: NSDate){
    self._firstName = firstName
    self._lastName = lastName
    self._birthday = DOB
  }
  
  
  


}
