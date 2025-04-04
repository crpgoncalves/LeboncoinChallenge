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
                        Spacer()
                        if vm.selectedCategories.contains(category.id) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            vm.toggleCategorySelection(category.id)
                        }
                    }
                }
            }
            .navigationTitle("list_screen.categories_title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("button_close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

