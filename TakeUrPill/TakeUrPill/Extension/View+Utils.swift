//
//  View+Utils.swift
//  TakeUrPill
//
//  Created by Alessio Roberto on 04/08/2019.
//  Copyright © 2019 Alessio Roberto. All rights reserved.
//

import SwiftUI

extension View {
    func strokedRoundedRectangle(
            cornerRadius r: CGFloat,
            lineWidth w: CGFloat = 1,
            color c: Color = .primary
        ) -> some View {

        return RoundedRectangle(cornerRadius: r).stroke(lineWidth: w).foregroundColor(c)
    }
}
