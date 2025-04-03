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
        return Array(repeating: GridItem(.flexible()),
                     count: 1)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(vm.ads) { ad in
                    ADItemView(ad: ad)
                }
            }
            .padding()
        }
        .onAppear {
            vm.fetchCategories()
        }
    }
}

#Preview {
    ListScreenView()
}
