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
        let columnsCount = UIScreen.main.bounds.width > 600 ? 2 : 1 
        return Array(repeating: GridItem(.flexible()), count: columnsCount)
    }
    var body: some View {
        NavigationView {
            if vm.isLoading {
                LoadingView()
            } else {
                ScrollView(showsIndicators: false) {
                    CategoryFilterButton(showCategoryModal: $showCategoryModal,
                                         selectedCategories: $vm.selectedCategories)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.filteredAds) { ad in
                            NavigationLink(
                                destination: ADDetailsViewControllerWrapper(ad: ADItemViewModel(ad: ad)),
                                label: {
                                    ADItemView(ad: ADItemViewModel(ad: ad))
                                })
                        }
                    }
                }
                .navigationTitle("list_screen.title")
                .navigationBarTitleDisplayMode(.inline)
                .fullScreenCover(isPresented: $showCategoryModal) {
                    CategoryFilterItem(vm: vm)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            vm.fetchData()
        }
    }
}
