//
//  HomeButtons.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 28/07/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import SwiftUI

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
            .strokedRoundedRectangle(cornerRadius: 12, color: Color.blue)
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
            .strokedRoundedRectangle(cornerRadius: 12, color: Color.blue)
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
            .strokedRoundedRectangle(cornerRadius: 12, color: Color.blue)
    }
}
