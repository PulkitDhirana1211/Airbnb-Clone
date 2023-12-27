//
//  MainTabView.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 28/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            WishlistsView()
                .tabItem {
                    Label("Wishlists", systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }

        }
    }
}

#Preview {
    MainTabView()
}
