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
                    .overlay(strokedRoundedRectangle(cornerRadius: 10, color: Color.gray))
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
                    .overlay(strokedRoundedRectangle(cornerRadius: 20, color: Color.blue))
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
        .overlay(strokedRoundedRectangle(cornerRadius: 16, lineWidth: 1, color: Color.blue))
    }
    
}

struct PillTypetRow: View {
    var name: String
    var amount: Int
    
    var body: some View {
        Group {
            Text("Pill: \(name) - ")
                .bold()
            Text("Quantity: \(amount)")
                .italic()
                .foregroundColor(Color.blue)
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

extension View {
    func strokedRoundedRectangle(
            cornerRadius r: CGFloat,
            lineWidth w: CGFloat = 1,
            color c: Color = .primary
        ) -> some View {

        return RoundedRectangle(cornerRadius: r).stroke(lineWidth: w).foregroundColor(c)
    }
}
