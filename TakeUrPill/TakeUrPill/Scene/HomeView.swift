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

struct ButtonsView: View {
    var body: some View {
        VStack(alignment: .center,
               spacing: 8, content: {
                NavigationLink(destination: AddPillView(manager: AddPillManager())) {
                    HStack(spacing: 10, content: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                        Text(NSLocalizedString("home.setpill.button.title",
                                               comment: ""))
                            .fontWeight(.bold)
                    })
                    .padding(22)
                        .border(Color.blue, cornerRadius: 12)
                }
                Button(action: {
                    print("tookpill")
                }) {
                    HStack(spacing: 10, content:  {
                        Image(systemName: "heart.circle.fill")
                            .font(.title)
                        Text(NSLocalizedString("home.tookpill.button.title",
                                               comment: ""))
                            .fontWeight(.bold)
                    })
                    .padding(22)
                        .border(Color.blue, cornerRadius: 12)
                }
                Button(action: {
                    print("setting")
                }) {
                    HStack(spacing: 10, content:  {
                        Image(systemName: "list.dash")
                            .font(.title)
                        Text(NSLocalizedString("home.history.button.title",
                                               comment: ""))
                            .fontWeight(.bold)
                    })
                    .padding(22)
                        .border(Color.blue, cornerRadius: 12)
                }
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
