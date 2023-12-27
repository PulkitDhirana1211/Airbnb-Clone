//
//  CustomStepperButton.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 28/12/23.
//

import SwiftUI

struct CustomStepperButton: View {
    
    let imageName: String
    var body: some View {
        Image(systemName: imageName)
            .frame(height: 18)
            .foregroundStyle(Color.black)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
            }
            .foregroundStyle(.gray)
    }
}

#Preview {
    CustomStepperButton(imageName: "")
}
