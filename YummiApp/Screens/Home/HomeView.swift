//
//  HomeView.swift
//  YummiApp
//
//  Created by Omar Abdulrahman on 04/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @StateObject private var viewModel = AppetizerViewModel()
    
    let rows: [GridItem] = [GridItem(.flexible())]
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // Categories Section
                Text("Categories".capitalized)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.top, 12)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(viewModel.categories, id: \.id) { category in
                            if viewModel.isLoading {
                                SkeletonView()
                            } else {
                                CategoriesView(category: category)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                    .padding(.leading, 12)
                    .padding(.bottom, 20)
                }
                
                // Populars Section
                Text("Populars".capitalized)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(viewModel.populars, id: \.id) { popular in
                            if viewModel.isLoading {
                                SkeletonView()
                            } else {
                                PopularsAndSpecialsRowView(populars: popular)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                    .padding(.leading, 12)
                    .padding(.bottom, 20)
                }

                // Specials Section
                Text("chef's Specials")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(viewModel.specials, id: \.id) { special in
                            if viewModel.isLoading {
                                SkeletonView()
                            } else {
                                SpeacialsRowView(populars: special)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                    .padding(.leading, 12)
                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("Yummi")
            .onAppear {
                viewModel.loads()
            }
        }
    }
}


// MARK: - PREVIEW

#Preview {
    HomeView()
}
