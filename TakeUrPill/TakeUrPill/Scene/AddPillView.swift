//
//  AddPillView.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 10/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import SwiftUI

struct AddPillView: View {
    @State private var pillName: String = ""
    @State private var selectedpillAmount = 0
    
    var pillAmount = ["0", "1", "2", "3", "4", "5"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Pill", text: $pillName)
                }
                Section {
                    Picker(selection: $selectedpillAmount,
                           label: Text("Please choose an amount")) {
                        ForEach(0 ..< pillAmount.count) {
                            Text(self.pillAmount[$0]).tag($0)
                        }
                    }
                }
                Section {
                    Button(action: {
                        AddPillManager.savePill(name: self.pillName,
                                                amount: self.selectedpillAmount)
                    }) {
                        Text("Save")
                        .font(.title)
                    }
                }
            }
                .navigationBarTitle(Text(NSLocalizedString("home.title", comment: "")), displayMode: .inline)
        }
    }
}

struct AddPillManager {
    static func savePill(name: String, amount: Int) {
        print(name)
        print(amount)
    }
}

#if DEBUG
struct AddPillView_Previews : PreviewProvider {
    static var previews: some View {
        AddPillView()
    }
}
#endif
