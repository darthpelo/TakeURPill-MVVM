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
    var body: some View {
        VStack(alignment: .center,
               spacing: 8,
               content: {
                NavigationLink(destination: AddPillView(manager: AddPillManager())) {
                    FirstButton()
                }
                Button(action: {
                    print("test")
                }) {
                    SecondButton()
                }
                NavigationLink(destination: AddPillView(manager: AddPillManager())) {
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
