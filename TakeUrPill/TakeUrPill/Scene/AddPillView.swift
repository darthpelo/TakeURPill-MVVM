//
//  AddPillView.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 10/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Combine
import SwiftUI

struct AddPillView: View {
    private var list: [PillType] = [PillType(id: UUID(),
                                             amount: 1,
                                             name: "Aspirina")]
    @ObjectBinding var manager = AddPillManager()
    
    @State private var pillName: String = ""
    @State private var selectedpillAmount = 0
    @State private var showingAlert = false
    
    var pillAmount = ["0", "1", "2", "3", "4", "5"]
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    TextField("Pill", text: $pillName)
                        .padding(20)
                    Picker(selection: $selectedpillAmount,
                           label: Text("Please choose an amount")
                            .font(.subheadline)) {
                                ForEach(0 ..< pillAmount.count) {
                                    Text(self.pillAmount[$0]).tag($0)
                                }
                    }
                    .padding(20)
                }
                Section {
                    Button(action: {
                        _ = self.manager.savePill(name: self.pillName,
                                                  amount: self.selectedpillAmount)
                    }) {
                        Text("Save")
                            .font(.title)
                    }
                }
                Section {
                    Text("Pills saved")
                        .font(.title)
                    List(manager.list) { pill in
                        PillTypetRow(name: pill.name, amount: pill.amount ?? 0)
                    }
                }.padding(10)
            }
            .navigationBarTitle(Text("Add pill"), displayMode: .inline)
        }
    }
}

struct PillTypetRow: View {
    var name: String
    var amount: Int
    
    var body: some View {
        Text("Pill: \(name) - Quantity: \(amount)")
    }
}

class AddPillManager: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    var list: [PillType] = []
    
    func savePill(name: String, amount: Int) -> Bool {
        let storage = Storage()
        let pill = PillType(amount: amount, name: name)
        list.append(pill)
        didChange.send()
        return !storage.store(pill)
    }
}

#if DEBUG
struct AddPillView_Previews : PreviewProvider {
    static var previews: some View {
        AddPillView()
    }
}
#endif
