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
                .navigationBarTitle(Text(NSLocalizedString("home.title", comment: "")))
        }
    }
}

struct ButtonsView: View {
    var body: some View {
        VStack(alignment: .center,
               spacing: 60, content: {
                NavigationLink(destination: AddPillView()) {
                    Text("Add new Pill")
                }
                Button(action: {
                    print("tookpill")
                }) {
                    Text("")
                }.background(Image("tookpill"))
                Button(action: {
                    print("setting")
                }) {
                    Text("")
                }.background(Image("history"))
        })
    }
}


#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
