//
//  UserDefaults+Utils.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 10/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Foundation

extension UserDefaults {
    var userSession: Any? {
        get { return object(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var userHistory: Data? {
        get { return data(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var lastPill: Data? {
        get { return data(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var userIntentsHistory: Data? {
        get { return data(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var pillName: String? {
        get { return string(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var pillAmmount: Int? {
        get { return integer(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var pillsList: Data? {
        get { return data(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
