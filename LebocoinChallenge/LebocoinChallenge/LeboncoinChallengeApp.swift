//
//  LeboncoinChallengeApp.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import SwiftUI

@main
struct LeboncoinChallengeApp: App {
    @State private var isLaunchScreenActive = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if isLaunchScreenActive {
                    LaunchViewControllerRepresentable()
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    self.isLaunchScreenActive = false
                                }
                            }
                        }
                } else {
                    ListScreenView()
                }
            }
        }
    }
}
