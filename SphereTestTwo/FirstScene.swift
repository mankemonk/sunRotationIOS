//
//  FirstScene.swift
//  SphereTestTwo
//
//  Created by Théo Germain on 25/02/2019.
//  Copyright © 2019 Théo Germain. All rights reserved.
//

import UIKit
import SceneKit

class FirstScene: SCNScene {
    override init() {
        super.init()
        
        
        let sphereGeometry = SCNSphere(radius: 1)
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.red
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.rotation = SCNVector4(x: 0, y: 100, z: 0, w: 0)
        sphereNode.runAction(SCNAction.rotateBy(x: 0, y: 0, z: 0, duration: .infinity))
        sphereNode.castsShadow = true
        sphereNode.opacity = 0.55

//        let spotLight = SCNLight()
//        spotLight.type = .spot
//        spotLight.spotInnerAngle = 45
//        spotLight.spotOuterAngle = 45
//        spotLight.intensity = 1000        //set it right for the light to be displayed + rotating
//
//        sphereNode.light(spotLight)
//
        self.rootNode.addChildNode(sphereNode)
        

        
//
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.green
//        sphereNode.materials = [material]
//        self.rootNode.addChildNode(sphereNode)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



//class LightFeatures {
//    let position: SCNVector3
//    let orientation: SCNVector3
//    let color: UIColor
//
//    init(position: SCNVector3, orientation: SCNVector3, color: UIColor) {
//        self.position = position
//        self.orientation = orientation
//        self.color = color
//    }
//}
//
//class Light {
//    let node: SCNNode
//
//    init(lightNode: SCNNode) {
//        node = lightNode
//    }
//
//    init(lightFeatures: LightFeatures) {
//        node = SCNNode()
//        createLight()
//        set(lightFeatures: lightFeatures)
//    }
//
//    func createLight() {
//        node.light = SCNLight()
//    }
//
//    func set(lightFeatures: LightFeatures) {
//        node.light?.color = lightFeatures.color
//        node.position = lightFeatures.position
//        node.eulerAngles = lightFeatures.orientation;
//    }
//}
