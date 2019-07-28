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
    var body: some View {
        Picker(selection: $selectedpillAmount,
               label: Text("Please choose an amount")
                .font(.subheadline)) {
                    ForEach(0 ..< pillAmount.count) {
                        Text(self.pillAmount[$0]).tag($0)
                    }
        }
    }
}

#if DEBUG
struct PillsPickerView_Previews : PreviewProvider {
    static var previews: some View {
        PillsPickerView()
    }
}
#endif
