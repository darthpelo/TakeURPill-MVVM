//
//  AddPillViewModel.swift
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
    func loadPills()
}

final class AddPillViewModel: DataPersistance, ObservableObject {

    var objectWillChange = PassthroughSubject<Void, Never>()
    var list: [PillType] = []

    init() {
        loadPills()
    }
    
    func savePill(name: String, amount: Int) -> Bool {
        let storage = Storage()
        let pill = PillType(amount: amount, name: name)
        list.append(pill)
        objectWillChange.send()
        return !storage.store(pill)
    }
    
    func deletePill(at offsets: IndexSet) {
        if let first = offsets.first {
            list.remove(at: first)
            objectWillChange.send()
        }
    }

    func loadPills() {
        do {
            let data = try Storage().readTypes()
            let decoder = JSONDecoder()
            list = try decoder.decode([PillType].self, from: data)
            objectWillChange.send()
        } catch {

        }
    }
}

