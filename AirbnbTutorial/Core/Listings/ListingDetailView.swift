//
//  ListingDetailView.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 27/12/23.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()
                    .frame(height: 320)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                        .background {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }

            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("4.86")
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(Color.black)
                    
                    Text("Miami, Florida")
                    
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // host info view
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire Villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("profile_photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // listing features
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(0 ..< 2, id: \.self) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experience, highly rated hosts who are committed to providing great stars to guests")
                                .font(.caption)
                                .foregroundStyle(Color.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // bedrooms view
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ..< 5) { bedroom in
                            
                            VStack(alignment: .leading) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                }
            }
            .padding()
            
            Divider()
            
            // listing amenities
            VStack(alignment: .leading, spacing: 16) {
                
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(0 ..< 5) { feature in
                    HStack {
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                if #available(iOS 17.0, *) {
                    Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    Text("")
                }
                
            }
            .padding()
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(Color.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(Color.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                }
                .padding(.horizontal, 32)
            }
            .background(Color.white)
            
        }
        
    }
}

#Preview {
    ListingDetailView()
}
