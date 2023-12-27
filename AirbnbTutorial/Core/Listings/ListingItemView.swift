//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 18/12/23.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Miami Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)

                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(Color.black)
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 6)
                
                //ratings
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                .foregroundStyle(Color.black)

            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
