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
        
        //this for drawLine file only
        let twoPointsNode1 = SCNNode()
        self.rootNode.addChildNode(twoPointsNode1.buildLineInTwoPointsWithRotation(
            from: SCNVector3(1,-1,3), to: SCNVector3( 7,1,7), radius: 0.1, color: .green))
        //ends
        
        // THE SPHERE
        
        let sphereGeometry = SCNSphere(radius: 0.5)
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
        
       
        
        
    
        
        func createLines() {
            var path: UIBezierPath
            path = UIBezierPath()
            
            //            let cyanMaterial = SCNMaterial()
            //            cyanMaterial.diffuse.contents = UIColor.green
            
            path.move(to: CGPoint(x: 1, y: 3))
            path.addLine(to: CGPoint(x: 0.5, y: 1))
            path.addLine(to: CGPoint(x: 0.7, y: 3))
            path.close()
            
            let shape = SCNShape(path: path, extrusionDepth: 10)
            shape.firstMaterial?.metalness.contents = SCNMaterial()
            let shapeNode = SCNNode(geometry: shape)
            shapeNode.position = SCNVector3(x: 4, y: 7, z: 0);
            self.rootNode.addChildNode(shapeNode)
            shapeNode.rotation = SCNVector4(x: -10, y: 9, z: 0, w: 4)
            
            self.rootNode.addChildNode(shapeNode)
            }
        
        
        
        // CURVES (that could become main curves 'generator')
        
//        func new(array: [Any], add: Int) {
//            var newArray = 0
//            while newArray < num {
//                newArray += 1
//            }
//            return
//        }
//
//        var curvesArray: [Int] = [bezierCurves]()
//        var i = 0
//        while i < num {
//            i = i + 1
//            curvesArray[i] = SCNShape.new(bezierCurves)
//        }
//
//
//        curvesArray.append(i)
//        for curvesArray in 0..< (num) {
//            new(array: bezierCurves, add: 1)
//        }

       // self.parentNode!.addChildNode(bezierCurves)



    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
