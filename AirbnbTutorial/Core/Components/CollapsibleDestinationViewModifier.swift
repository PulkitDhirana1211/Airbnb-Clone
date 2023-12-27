//
//  CollapsibleDestinationViewModifier.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 28/12/23.
//

import SwiftUI

struct CollapsibleDestinationViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
