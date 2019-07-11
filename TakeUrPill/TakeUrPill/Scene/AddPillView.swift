//
//  AddPillView.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 10/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import SwiftUI

struct AddPillView: View {
    private var list: [PillType] = [PillType(id: UUID(),
                                             amount: 1,
                                             name: "Aspirina")]
    @State private var pillName: String = ""
    @State private var selectedpillAmount = 0
    
    var pillAmount = ["0", "1", "2", "3", "4", "5"]
    
    var body: some View {
        NavigationView {
            List(list) { pill in
                PillTypetRow(name: pill.name)
            }
//            Form {
//                Section {
//                    TextField("Pill", text: $pillName)
//                }
//                Section {
//                    Picker(selection: $selectedpillAmount,
//                           label: Text("Please choose an amount")) {
//                            ForEach(0 ..< pillAmount.count) {
//                                Text(self.pillAmount[$0]).tag($0)
//                            }
//                    }
//                }
//                Section {
//                    Button(action: {
//                        AddPillManager.savePill(name: self.pillName,
//                                                amount: self.selectedpillAmount)
//                    }) {
//                        Text("Save")
//                            .font(.title)
//                    }
//                }
//                Section {
//                    List(list) { pill in
//                        PillTypetRow(name: pill.name)
//                    }
//                }
//            }
            .navigationBarTitle(Text("Add pill"), displayMode: .inline)
        }
    }
}

struct PillTypetRow: View {
    var name: String

    var body: some View {
        Text("Pill: \(name)")
    }
}

struct AddPillManager {
    static func savePill(name: String, amount: Int) {
        let storage = Storage()
        let pill = PillType(amount: amount, name: name)
        storage.store(pill)
    }
}

#if DEBUG
struct AddPillView_Previews : PreviewProvider {
    static var previews: some View {
        AddPillView()
    }
}
#endif
