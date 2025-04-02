//
//  ListScreenView.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import SwiftUI

struct ListScreenView: View {
    
    @StateObject private var vm = ListScreenViewModel()
    
    var body: some View {
        ForEach(vm.categories) {
            Text($0.name)
        }
        .onAppear {
            vm.fetchCategories()
        }
        .padding()
    }
}

#Preview {
    ListScreenView()
}
