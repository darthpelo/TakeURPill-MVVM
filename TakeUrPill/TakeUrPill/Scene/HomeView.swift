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
                    FirstButton()
                }
                NavigationLink(destination: AddPillView(manager: AddPillManager())) {
                    SecondButton()
                }
                NavigationLink(destination: AddPillView(manager: AddPillManager())) {
                    ThirdButton()
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

struct FirstButton : View {
    var body: some View {
        return HStack(spacing: 10, content: {
            Image(systemName: "plus.circle.fill")
                .font(.title)
                .frame(width: 30
                    , height: 30)
            Text(NSLocalizedString("home.setpill.button.title",
                                   comment: ""))
                .fontWeight(.bold)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .frame(width: 100
                    , height: 44)
        })
            .frame(width: 180
                , height: 64)
            .border(Color.blue, cornerRadius: 12)
    }
}

struct SecondButton : View {
    var body: some View {
        return  HStack(spacing: 10, content:  {
            Image(systemName: "heart.circle.fill")
                .font(.title)
                .frame(width: 30
                    , height: 30)
            Text(NSLocalizedString("home.tookpill.button.title",
                                   comment: ""))
                .fontWeight(.bold)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .frame(width: 100
                    , height: 44)
        })
            .frame(width: 180
                , height: 64)
            .border(Color.blue, cornerRadius: 12)
    }
}

struct ThirdButton : View {
    var body: some View {
        return HStack(spacing: 10, content:  {
            Image(systemName: "list.dash")
                .font(.title)
                .frame(width: 30
                    , height: 30)
            Text(NSLocalizedString("home.history.button.title",
                                   comment: ""))
                .fontWeight(.bold)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .frame(width: 100
                    , height: 44)
        })
            .frame(width: 180
                , height: 64)
            .border(Color.blue, cornerRadius: 12)
    }
}
