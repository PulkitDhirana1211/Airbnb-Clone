//
//  ExploreView.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 18/12/23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                
                ScrollView {
                    
                    SearchAndFilterView()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    ForEach(0 ... 10, id: \.self) { listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
