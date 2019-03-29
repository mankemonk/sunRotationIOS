//
//  FirstScene.swift
//  SphereTestTwo
//
//  Created by Théo Germain on 25/02/2019.
//  Copyright © 2019 Théo Germain. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

class FirstScene: SCNScene {
    override init() {
        super.init()
        
        //this for drawLine file only
//        let twoPointsNode1 = SCNNode()
//        self.rootNode.addChildNode(twoPointsNode1.buildLineInTwoPointsWithRotation(
//            from: SCNVector3(1,-1,3), to: SCNVector3( 7,1,7), radius: 0.1, color: .green))
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
        spinSphere.repeatCount = .greatestFiniteMagnitude
        
        sphereNode.addAnimation(spinSphere, forKey: "transform.rotation.z")
        
        // AMBIENT LIGHT
        
        let lightAmbientNode = SCNNode()
        lightAmbientNode.light = SCNLight()
        lightAmbientNode.light?.type = .ambient
        lightAmbientNode.light?.intensity = 500 //1000 is probably best
        lightAmbientNode.light?.color = UIColor.white
        
        self.rootNode.addChildNode(lightAmbientNode)
        
        // OMNI, BUT NOT REALLY
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 100, y: 0, z: 300) //z:30 is fine too i guess
        lightNode.light?.intensity = 500
        lightNode.light?.color = UIColor.init(white: 1, alpha: 0.7)
        
        // its spins too
        let spin2 = CABasicAnimation(keyPath: "rotation")
        spin2.fromValue = NSValue(scnVector4: SCNVector4(-200, 0, 0, 0))
        spin2.toValue = NSValue(scnVector4: SCNVector4(200, 0, 0, 0))
        spin2.duration = 400
        spin2.repeatCount = .greatestFiniteMagnitude
        
        lightNode.addAnimation(spin2, forKey: "transform.spin2.x")
        
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
        spin.duration = 10
        spin.timingFunction = CAMediaTimingFunction(controlPoints: 200, 200, 200, 200)
        spin.repeatCount = .greatestFiniteMagnitude // make it a GOOD LOOP (.infinity ??)
        spin.repeatDuration = 10
        
        secondLightNode.addAnimation(spin, forKey: "transform.spin.x") //spinaround
        //secondLightNode.
        let group = CAAnimationGroup()
        group.animations = [spin, spin2, spinSphere]
        group.duration = .greatestFiniteMagnitude
        
        //first anchor for the curves
        var lineAnchor = SCNVector3(x1, y1, z1)
        
        func line(pointA: Float, //or is it float/double ????? it is (no SCNVECTOR3 here??)
                  pointB: Float,
                  pointC: Float,
                  pointD: Float,
                  pointE: Float,
                  pointF: Float,
                  pointG: Float,
                  pointH: Float,
                  pointI: Float) -> SCNVector3 {
            
            var beLines1 = SCNVector3(x: pointA, y: pointB, z: pointC)
            var beLines2 = SCNVector3(x: pointD, y: pointE, z: pointF)
            var beLines3 = SCNVector3(x: pointG, y: pointH, z: pointI)
            
            var pointA = x1+randomDist1
            var pointB = y1+randomDist2
            var pointC = z1+randomDist3
            var pointD = x2+randomDist4
            var pointE = y2+randomDist5
            var pointF = z2+randomDist6
            var pointG = x2
            var pointH = y2
            var pointI = z2
            
            // now, do the lines.
            
            return SCNVector3()
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
