//
//  ImmersiveView.swift
//  VisionA1
//
//  Created by Joel Sereno on 1/9/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            
            // add 3D scene
            
            // create an entity and entity model
            // model for USDZ type files include two children
            if let boxModel = try? await Entity(named: "box"), let box = boxModel.children.first?.children.first {
                content.add(box)
            }
            
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
