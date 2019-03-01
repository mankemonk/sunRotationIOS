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
        
        // THE SPHERE
        
        let sphereGeometry = SCNSphere(radius: 1)
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.init(red: 1, green: 0.1, blue: 0, alpha: 0.8)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.castsShadow = true
        sphereNode.opacity = 0.85
        
        self.rootNode.addChildNode(sphereNode)
        
        // Make the sphere rotate around y-axis.
        let spinSphere = CABasicAnimation(keyPath: "rotation")
        spinSphere.fromValue = NSValue(scnVector4: SCNVector4(0, 1, 0, 300))
        spinSphere.toValue = NSValue(scnVector4: SCNVector4(0, 1, 0, 250))
        spinSphere.duration = 430
        spinSphere.repeatCount = .infinity
        
        sphereNode.addAnimation(spinSphere, forKey: "spinaround")
        
        // AMBIENT LIGHT
        
        let lightAmbientNode = SCNNode()
        lightAmbientNode.light = SCNLight()
        lightAmbientNode.light?.type = .ambient
        lightAmbientNode.light?.intensity = 1000
        lightAmbientNode.light?.color = UIColor.white
        
        self.rootNode.addChildNode(lightAmbientNode)
        
        // OMNI, BUT NOT REALLY
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 100, y: 0, z: 30)
        lightNode.light?.intensity = 500
        lightNode.light?.color = UIColor.init(white: 1, alpha: 0.7)
        
        // its spins too
        let spin2 = CABasicAnimation(keyPath: "rotation")
        spin2.fromValue = NSValue(scnVector4: SCNVector4(-200, 0, 0, 0))
        spin2.toValue = NSValue(scnVector4: SCNVector4(200, 0, 0, 0))
        spin2.duration = 200
        spin2.repeatCount = .infinity
        
        lightNode.addAnimation(spin2, forKey: "spinaround")
        
        self.rootNode.addChildNode(lightNode)
        
        // SPOT WHO TURNS
        
        let secondLightNode = SCNNode()
        secondLightNode.light = SCNLight()
        secondLightNode.light?.type = .spot
        secondLightNode.position = SCNVector3(x: 30, y: 0, z: 100)
        secondLightNode.light?.intensity = 4000
        secondLightNode.light?.color = UIColor.init(white: 1, alpha: 0.35)
        
        self.rootNode.addChildNode(secondLightNode)
        
        // Mke the light rotate around the z-axis
        let spin = CABasicAnimation(keyPath: "rotation")
        spin.fromValue = NSValue(scnVector4: SCNVector4(x: 200, y: 0, z: 0, w: 0))
        spin.toValue = NSValue(scnVector4: SCNVector4(x: -200, y: 0, z: 0, w: 1))
        spin.duration = 35
        spin.repeatCount = .infinity

        secondLightNode.addAnimation(spin, forKey: "spinaround")
        

        
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



