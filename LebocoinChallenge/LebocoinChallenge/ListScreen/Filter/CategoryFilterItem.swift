//
//  CategoryFilterItem.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import SwiftUI

struct CategoryFilterItem: View {
    let category: ADCategory
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .white : .blue)
                Text(Localized.string(category.name))
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
