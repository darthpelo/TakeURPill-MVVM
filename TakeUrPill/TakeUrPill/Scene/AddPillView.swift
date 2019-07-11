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
    @ObjectBinding var manager = AddPillManager()
    
    @State private var pillName: String = ""
    @State private var selectedpillAmount = 0
    @State private var showingAlert = false
    
    var pillAmount = ["0", "1", "2", "3", "4", "5"]
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    TextField("Pill name", text: $pillName)
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
    
    func delete(at offsets: IndexSet) {
        manager.deletePill(at: offsets)
    }
}

struct PillTypetRow: View {
    var name: String
    var amount: Int
    
    var body: some View {
        Group {
            Text("Pill: \(name) - ").bold()
            Text("Quantity: \(amount)").italic().color(Color.blue)
        }
    }
}


#if DEBUG
struct AddPillView_Previews : PreviewProvider {
    static var previews: some View {
        AddPillView()
    }
}
#endif
