//
//  AddPillManager.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 11/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Combine
import SwiftUI

final class AddPillManager: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    var list: [PillType] = []
    
    func savePill(name: String, amount: Int) -> Bool {
        let storage = Storage()
        let pill = PillType(amount: amount, name: name)
        list.append(pill)
        didChange.send()
        return !storage.store(pill)
    }
    
    func deletePill(at offsets: IndexSet) {
        if let first = offsets.first {
            list.remove(at: first)
            didChange.send()
        }
    }
}
