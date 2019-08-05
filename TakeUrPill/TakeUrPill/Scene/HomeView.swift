//
//  HomeView.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 09/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        NavigationView {
            ButtonsView()
                .navigationBarTitle(Text(NSLocalizedString("home.title", comment: "")),
                                    displayMode: .large)
        }
    }
}

private struct ButtonsView: View {
    @State var showPicker = false
    
    var body: some View {
        VStack(alignment: .center,
               spacing: 8,
               content: {
                NavigationLink(destination: AddPillView(manager: AddPillViewModel())) {
                    FirstButton()
                }
                Button(action: {
                    withAnimation {
                        self.showPicker.toggle()
                    }
                }) {
                    SecondButton()
                }
                if showPicker {
                    PillsPickerView(manager: AddPillViewModel())
                        .transition(.move(edge: .bottom))
                }
                NavigationLink(destination: AddPillView(manager: AddPillViewModel())) {
                    ThirdButton()
                }
        })
    }
}

private func pillola() {
    
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
