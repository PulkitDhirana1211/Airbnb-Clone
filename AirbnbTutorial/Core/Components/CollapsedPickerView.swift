//
//  CollapsedPickerView.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 28/12/23.
//

import SwiftUI

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

#Preview {
    CollapsedPickerView(title: "", description: "")
}
