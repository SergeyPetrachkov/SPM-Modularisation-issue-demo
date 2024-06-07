//
//  ContentView.swift
//  SPM-Modularisation-Issue-Demo
//
//  Created by Sergey Petrachkov on 07.06.2024.
//

import SwiftUI

struct ContentView: View {

    let appNavigator = AppNavigator.make()

    var body: some View {
        switch appNavigator.navigationState {
        case .loading:
            ProgressView()
                .onAppear {
                    appNavigator.start()
                }
        case .onboarding(let view):
            view
        case .featureOne(let view):
            view
        }
    }
}
