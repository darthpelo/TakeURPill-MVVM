//
//  PillsPicker.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 28/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import Combine
import SwiftUI

struct PillsPickerView: View {
    var manager: AddPillViewModel
    @State private var selectedpill = 0
    
    var body: some View {
        Picker(selection: $selectedpill,
               label: Text("Please choose an amount")
                .font(.subheadline)) {
                    ForEach(0 ..< manager.list.count) {
                        Text(self.manager.list[$0].name)
                    }
        }
    }
}

#if DEBUG
struct PillsPickerView_Previews : PreviewProvider {
    static var previews: some View {
        PillsPickerView(manager: AddPillViewModel())
    }
}
#endif
