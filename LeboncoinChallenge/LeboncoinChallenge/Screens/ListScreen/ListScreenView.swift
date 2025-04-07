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
    @State private var orientation = UIDeviceOrientation.unknown
    
    /*
     iPhone && portrait - 1 column
     iPhone && !portrait - 2 columns
     iPad && portrait - 2 columns
     iPad && !portrait - 3 columns
     */
    var columns: [GridItem] {
        return Array(repeating: GridItem(.flexible()),
                     count: UIDevice.current.userInterfaceIdiom == .phone ? (orientation.isPortrait ? 1 : 2) : (orientation.isPortrait ? 2 : 3))
    }
    
    var body: some View {
        NavigationView {
            if vm.isLoading {
                LoadingView()
            } else if !vm.errorMessage.isEmpty {
                ErrorView(message: vm.errorMessage) {
                    vm.fetchData()
                }
            } else{
                ScrollView(showsIndicators: false) {
                    CategoryFilterButton(showCategoryModal: $showCategoryModal,
                                         selectedCategories: $vm.selectedCategories)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.filteredAds) { ad in
                            NavigationLink(
                                destination: ADDetailsViewControllerWrapper(
                                    ad: ADItemViewModel(ad: ad)),
                                label: {
                                    ADItemView(ad: ADItemViewModel(ad: ad))
                                })
                        }
                    }
                }
                .searchable(text: $vm.searchText,
                            prompt: "list_screen.search.filter")
                .navigationTitle("list_screen.title")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .fullScreenCover(isPresented: $showCategoryModal) {
            CategoryFilterItem(vm: vm)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onRotate {
            orientation = $0
        }
        .onAppear {
            vm.fetchData()
        }
    }
}
