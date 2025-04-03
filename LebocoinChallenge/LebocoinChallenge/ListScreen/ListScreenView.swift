//
//  ListScreenView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//
import SwiftUI

struct ListScreenView: View {
    
    @StateObject private var vm = ListScreenViewModel()

    var columns: [GridItem] {
        return Array(repeating: GridItem(.flexible()), count: 1)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal,
                           showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(vm.categories) { category in
                            CategoryFilterItem(category: category,
                                               isSelected: vm.selectedCategories.contains(category.id)) {
                                withAnimation {
                                    vm.toggleCategorySelection(category.id)
                                }
                            }
                        }
                    }
                    .padding()
                }

                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.filteredAds) { ad in
                            ADItemView(ad: ad)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("list_screen.title")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            vm.fetchCategories()
        }
    }
}

#Preview {
    ListScreenView()
}
