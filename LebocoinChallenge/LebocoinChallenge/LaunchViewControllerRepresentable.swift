//
//  LaunchViewControllerRepresentable.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//


import SwiftUI
import UIKit

struct LaunchViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LaunchViewController {
        return LaunchViewController()
    }

    func updateUIViewController(_ uiViewController: LaunchViewController, context: Context) {
    }
}
