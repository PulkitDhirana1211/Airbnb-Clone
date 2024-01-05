//
//  DestinationSearchView.swift
//  AirbnbTutorial
//
//  Created by Pulkit Dhirana on 28/12/23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests: Int = 0
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                
                if selectedOption == .location {
                    
                    Text("Where to?")
                        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                            .foregroundStyle(Color("customTextColor"))
                        
                        TextField("Search Destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            
            // date selection view
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        DatePicker("From", selection: $startDate, in: Date()..., displayedComponents: .date)
                            .onTapGesture(count: 99, perform: {
                                // overrides tap gesture to fix ios 17.1 bug
                            })
                        Divider()
                        DatePicker("To", selection: $endDate, in: startDate..., displayedComponents: .date)
                            .onTapGesture(count: 99, perform: {
                                // overrides tap gesture to fix ios 17.1 bug
                            })
                        Divider()
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
            
            
            // num guests view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text("Adults")
                        
                        Spacer()
                        
                        stepperView
                        
                    }
                    
                    //                    Stepper {
                    //                        Text("\(numGuests) Adults")
                    //                    } onIncrement: {
                    //                        numGuests += 1
                    //                    } onDecrement: {
                    //                        guard numGuests > 0 else { return }
                    //                            numGuests -= 1
                    //                    }
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

extension DestinationSearchView {
    
    private var stepperView: some View {
        HStack {
            
            Button {
                guard numGuests > 0 else { return }
                numGuests -= 1
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            } label: {
                CustomStepperButton(imageName: "minus")
            }
            .disabled(numGuests == 0 ? true : false)
            
            Text("\(numGuests)")
                .frame(width: 30)
            
            Button {
                numGuests += 1
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            } label: {
                CustomStepperButton(imageName: "plus")
            }
        }
    }
}
