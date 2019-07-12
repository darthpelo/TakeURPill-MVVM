//
//  AddPillManager.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 11/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Combine
import SwiftUI

protocol DataPersistance {
    func savePill(name: String, amount: Int) -> Bool
    func deletePill(at offsets: IndexSet)
    func loadPills() -> [PillType]
}

final class AddPillManager: DataPersistance, BindableObject {
    func loadPills() -> [PillType] {
        do {
            let data = try Storage().readTypes()
            let decoder = JSONDecoder()
            list = try decoder.decode([PillType].self, from: data)
        } catch {}

        return list.sorted { $0.name > $1.name }
    }

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

