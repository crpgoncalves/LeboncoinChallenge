//
//  ListScreenView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//
import SwiftUI

struct ListScreenView: View {
    
    @StateObject private var vm = ListScreenViewModel()
    @State private var showCategoryModal = false
    
    var columns: [GridItem] {
        return Array(repeating: GridItem(.flexible()), count: 1)
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                CategoryFilterButton(showCategoryModal: $showCategoryModal,
                                     selectedCategories: $vm.selectedCategories)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.filteredAds) { ad in
                        ADItemView(ad: ADItemViewModel(ad: ad))
                    }
                }
            }
            .navigationTitle("list_screen.title")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showCategoryModal) {
                CategoryFilterItem(vm: vm)
            }
        }
        .onAppear {
            vm.fetchData()
        }
    }
    
}

#Preview {
    ListScreenView()
}
