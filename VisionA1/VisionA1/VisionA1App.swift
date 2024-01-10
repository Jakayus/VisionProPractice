//
//  VisionA1App.swift
//  VisionA1
//
//  Created by Joel Sereno on 1/9/24.
//

import SwiftUI

@main
struct VisionA1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
