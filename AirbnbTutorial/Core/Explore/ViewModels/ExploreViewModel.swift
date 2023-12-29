//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 29/12/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var originalListings = [Listing]()
    
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.originalListings = listings
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased().contains(searchLocation.lowercased()) ||
            $0.state.lowercased().contains(searchLocation.lowercased())
        })
        
        self.listings = filteredListings.isEmpty ? originalListings : filteredListings
        
    }
}
