//
//  ContentView.swift
//  VisionA1
//
//  Created by Joel Sereno on 1/9/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Text("📦")
                .foregroundStyle(.yellow)
                .font(.custom("Menlo",size: 100))
                .bold()
        }
        .padding()
        .task {
            // only need to open immersive space
            await openImmersiveSpace(id: "ImmersiveSpace")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
