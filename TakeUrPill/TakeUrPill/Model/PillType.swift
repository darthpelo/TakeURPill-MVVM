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

#if DEBUG
let testData: [PillType] = [PillType(amount: 1, name: "Aspirina"),
                            PillType(amount: 1, name: "Paracetamol"),
                            PillType(amount: 1, name: "Vitamin D"),
                            PillType(amount: 1, name: "Red")]
#endif
