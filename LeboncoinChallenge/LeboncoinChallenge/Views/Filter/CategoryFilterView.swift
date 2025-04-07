//
//  CategoryFilterItem.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import SwiftUI

struct CategoryFilterItem: View {
    
    @ObservedObject var vm: ListScreenViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.categories) { category in
                    HStack {
                        Text(Localized.string(category.name))
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        if vm.selectedCategories.contains(category.id) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                                .font(.title2)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                                .font(.title2)
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(vm.selectedCategories.contains(category.id) ? Color.blue : Color.gray.opacity(0.3), lineWidth: 2)
                                    .background(vm.selectedCategories.contains(category.id) ? Color.blue.opacity(0.1) : Color.clear)
                                    .cornerRadius(10)
                                    .shadow(radius: 5))
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            vm.toggleCategorySelection(category.id)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Localized.string("list_screen.categories_title"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text(Localized.string("button_close"))
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        vm.resetFilter()
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
            }
        }
        .accentColor(.blue)
    }
}
