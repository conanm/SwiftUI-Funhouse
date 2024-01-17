//
//  GlobeView.swift
//  swiftUI_stuff
//
//  Created by Conan Moriarty on 15/1/24.
//

import SwiftUI
import SceneKit

struct TestSceneKit: View {
    var body: some View {
        SceneView()
    }
}

struct SceneView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        let scene = SCNScene()
        scnView.scene = scene

        let sphere = SCNSphere(radius: 1.0)
        let sphereNode = SCNNode(geometry: sphere)
        scene.rootNode.addChildNode(sphereNode)

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)

        return scnView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        // Update the view if needed
    }
}


#Preview {
  TestSceneKit()
}
