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
    var manager: AddPillManager
    var pillAmount = ["Don't know", "1", "2", "3", "4", "5"]
    
    @State private var pillName: String = ""
    @State private var selectedpillAmount = 0
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Section {
                TextField("Pill name", text: $pillName)
                    .padding(8)
                    .border(Color.gray, cornerRadius: 10)
                Picker(selection: $selectedpillAmount,
                       label: Text("Please choose an amount")
                        .font(.subheadline)) {
                            ForEach(0 ..< pillAmount.count) {
                                Text(self.pillAmount[$0]).tag($0)
                            }
                }
            }
            .padding(8)
            Section {
                Button(action: {
                    _ = self.manager.savePill(name: self.pillName,
                                              amount: self.selectedpillAmount)
                }) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        .font(.title)
                        Text("Add").fontWeight(.light)
                    }
                }
                .padding(10)
                    .border(Color.blue, cornerRadius: 20)
                    .font(.body)
                    .foregroundColor(.blue)
                
            }
            Section {
                PillListView(manager: manager)
            }
            .padding(8)
        }
        .navigationBarTitle(Text("Add pill"), displayMode: .inline)
    }
    
    func delete(at offsets: IndexSet) {
        manager.deletePill(at: offsets)
    }
}

struct PillListView: View {
    @ObjectBinding var manager: AddPillManager
    
    var body: some View {
        VStack {
            Text("Pills added")
                .font(.title)
            List(manager.list) { pill in
                PillTypetRow(name: pill.name, amount: pill.amount ?? 0)
            }
            .deleteDisabled(false)
        }
        .padding(10)
            .border(Color.blue, width: 1, cornerRadius: 16)
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
        AddPillView(manager: AddPillManager())
    }
}
#endif
