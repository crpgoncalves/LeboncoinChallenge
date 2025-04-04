//
//  CategoryFilterButton.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 04/04/2025.
//

import SwiftUI

struct CategoryFilterButton: View {
    
    @Binding var showCategoryModal: Bool
    @Binding var selectedCategories: Set<Int>

    var body: some View {
        HStack {
            Button(action: {
                showCategoryModal.toggle()
            }) {
                HStack(alignment: .center) {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.white)
                    Text("list_screen.categories")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    if selectedCategories.count > 0 {
                        Text("\(selectedCategories.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Circle().fill(Color.black))
                    }
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 2)
            }
            Spacer()
        }
        .padding()
    }
}
