//
//  ExploreService.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 29/12/23.
//

import Foundation

class ExploreService {
    
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
