//
//  PillType.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 11/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Foundation
import SwiftUI

struct PillType: Codable, Identifiable {
    var id = UUID()
    var amount: Int?
    var name: String
}

extension PillType: Equatable {
    static func == (lhs: PillType, rhs: PillType) -> Bool {
        return
            lhs.amount == rhs.amount &&
                lhs.name == rhs.name
    }
}
