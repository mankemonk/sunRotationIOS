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
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.init(red: 1, green: 0.1, blue: 0, alpha: 0.8)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.rotation = SCNVector4(x: 0, y: 100, z: 0, w: 0)
        sphereNode.runAction(SCNAction.rotateBy(x: 0, y: 0, z: 0, duration: .infinity))
        sphereNode.castsShadow = true
        sphereNode.opacity = 0.25
        
        self.rootNode.addChildNode(sphereNode)

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .spot
        lightNode.position = SCNVector3(x: 100, y: 0, z: 300)
        lightNode.light?.intensity = 4000
        lightNode.light?.color = UIColor.init(white: 1, alpha: 0.7)
        lightNode.runAction(SCNAction.rotateBy(x: 200, y: 100, z: 300, duration: .infinity))
        
        self.rootNode.addChildNode(lightNode)
        
        let secondLightNode = SCNNode()
        secondLightNode.light = SCNLight()
        secondLightNode.light?.type = .spot
        secondLightNode.position = SCNVector3(x: 300, y: 200, z: 0)
        secondLightNode.light?.intensity = 5000
        secondLightNode.light?.color = UIColor.white
        lightNode.runAction(SCNAction.rotateBy(x: 200, y: 200, z: 0, duration: .infinity))
        
        self.rootNode.addChildNode(secondLightNode)

        
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



