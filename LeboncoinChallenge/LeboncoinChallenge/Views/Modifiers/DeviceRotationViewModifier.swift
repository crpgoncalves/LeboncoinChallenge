//
//  DeviceRotationViewModifier.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    
    let action: (UIDeviceOrientation) -> Void
    @State private var lastOrientation: UIDeviceOrientation?

    func body(content: Content) -> some View {
        content
            .background(GeometryReader { _ in
                Color.clear
                    .onAppear {
                        detectInitialOrientation()
                    }
            })
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                triggerOrientation()
            }
    }

    private func detectInitialOrientation() {
        /*
         Use UIDevice if you want the physical orientation of the device.

         Use UIWindowScene.interfaceOrientation if you want the orientation of the user interface
         */
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

        let interfaceOrientation = scene.interfaceOrientation

        let deviceOrientation: UIDeviceOrientation = {
            switch interfaceOrientation {
            case .portrait:
                return .portrait
            case .portraitUpsideDown:
                return .portraitUpsideDown
            case .landscapeLeft:
                return .landscapeLeft
            case .landscapeRight:
                return .landscapeRight
            default:
                return .unknown
            }
        }()

        trigger(orientation: deviceOrientation)
    }

    private func triggerOrientation() {
        let orientation = UIDevice.current.orientation
        if orientation != .unknown && orientation != lastOrientation {
            trigger(orientation: orientation)
        }
    }

    private func trigger(orientation: UIDeviceOrientation) {
        lastOrientation = orientation
        action(orientation)
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
