//
//  LoadingView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ProgressView("list_screen.loading")
            .progressViewStyle(DefaultProgressViewStyle())
            .scaleEffect(2)
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.black.opacity(0.4))
    }
}
