//
//  ListScreenView.swift
//  LebocoinChallenge
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

struct CategoryFilterItem: View {
    let category: ADCategory
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .white : .blue)
                Text(category.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .black)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(isSelected ? Color.blue : Color.black, lineWidth: 1)
            )
            .shadow(color: isSelected ? Color.blue.opacity(0.5) : Color.clear, radius: 5, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ListScreenView()
}
