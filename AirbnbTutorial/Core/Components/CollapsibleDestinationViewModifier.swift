//
//  CollapsibleDestinationViewModifier.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 28/12/23.
//

import SwiftUI

struct CollapsibleDestinationViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .padding()
            .background(colorScheme == .dark ? Color.black : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
