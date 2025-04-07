//
//  ErrorView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//


import SwiftUI

struct ErrorView: View {
    let message: String
    var retryAction: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)

            Text("error_view.title")
                .font(.title2)
                .fontWeight(.bold)

            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)

            if let retryAction = retryAction {
                Button(action: retryAction) {
                    Text("error_view.try.again")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
