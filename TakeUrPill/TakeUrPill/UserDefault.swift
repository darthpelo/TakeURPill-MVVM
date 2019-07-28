//
//  UserDefault.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 28/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    private let suitName = "group.com.alessioroberto.TakeURPill.Shared"
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults(suiteName: suitName)?.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults(suiteName: suitName)?.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsConfig {
    @UserDefault("pillName", defaultValue: "")
    static var pillName: String
    
    @UserDefault("pillAmmount", defaultValue: 0)
    static var pillAmmount: Int
    
    @UserDefault("pillsList", defaultValue: nil)
    static var pillsList: Data?
    
    @UserDefault("userIntentsHistory", defaultValue: nil)
    static var userIntentsHistory: Data?
    
    @UserDefault("userHistory", defaultValue: nil)
    static var userHistory: Data?
    
    @UserDefault("lastPill", defaultValue: nil)
    static var lastPill: Data?
}
