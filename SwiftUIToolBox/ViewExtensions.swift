//
//  ViewExtensions.swift
//  SwiftUIToolBox
//
//  Created by Kakeru Fukuda on 2022/01/05.
//

import SwiftUI

extension View {
    func didBecomeActive(action: @escaping () -> Void) -> some View {
        onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            action()
        }
    }
}
