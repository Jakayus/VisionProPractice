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
            
            /// Create a floor
            
            // create floor
            let floor = ModelEntity(mesh: .generatePlane(width: 50, depth: 50), materials: [OcclusionMaterial()])
            // create physics properties
            floor.generateCollisionShapes(recursive: false)
            floor.components[PhysicsBodyComponent.self] = .init(
                massProperties: .default,
                mode: .static // does not move
            )
            // add floor to content
            content.add(floor)
            
            
            /// create an entity and entity model
        
            // model for USDZ type files include two children
            if let boxModel = try? await Entity(named: "box"), let box = boxModel.children.first?.children.first {
                // positioning
                box.position.y = 0.5
                box.position.z = -1
                
                // physics properties
                
                box.generateCollisionShapes(recursive: false)
                box.components.set(InputTargetComponent())
                
                box.components[PhysicsBodyComponent.self] = .init(
                    massProperties: .default,
                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1), // restituation is bounciness
                    mode: .dynamic
                )
                box.components[PhysicsMotionComponent.self] = .init()
                
                content.add(box)
            }
            
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
