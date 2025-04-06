//
//  ADDetailsView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//


import SwiftUI

struct ADDetailsView: View {
    let ad: ADItemViewModel

    var body: some View {
        ADDetailsViewControllerWrapper(ad: ad)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ADDetailsViewControllerWrapper: UIViewControllerRepresentable {
    let ad: ADItemViewModel

    func makeUIViewController(context: Context) -> ADDetailsViewController {
        let viewController = ADDetailsViewController(ad: ad)
        return viewController
    }

    func updateUIViewController(_ uiViewController: ADDetailsViewController, context: Context) {
    }
}
