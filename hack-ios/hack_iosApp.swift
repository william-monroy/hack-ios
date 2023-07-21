//
//  hack_iosApp.swift
//  hack-ios
//
//  Created by William Frank Monroy Mamani on 20/07/23.
//

import SwiftUI

@main
struct hack_iosApp: App {
    
    @StateObject private var predictionStatus = PredictionStatus()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(predictionStatus)
        }
    }
}
