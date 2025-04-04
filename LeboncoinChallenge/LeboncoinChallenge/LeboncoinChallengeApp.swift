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
                ListScreenView()
                    .opacity(isLaunchScreenActive ? 0 : 1)
                    .animation(.easeInOut(duration: 0.5), value: isLaunchScreenActive)

                if isLaunchScreenActive {
                    LaunchViewControllerRepresentable()
                        .transition(.opacity)
                        .zIndex(1)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    self.isLaunchScreenActive = false
                                }
                            }
                        }
                }
            }
        }
    }
}
