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
}
