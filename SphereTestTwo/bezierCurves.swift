//
//  bezierCurves.swift
//  SphereTestTwo
//
//  Created by Théo Germain on 27/02/2019.
//  Copyright © 2019 Théo Germain. All rights reserved.
//

import Foundation
import SceneKit
import UIKit

let num:Int = 7500
let rx = 0
let ry = 0
let dist = 1.35
let pi = CGFloat.pi
let radius:CGFloat = 2


class bezierCurves: SCNScene {
    
    override init() {
        super.init()
        
        var lineWidth: CGFloat // (stroke)
        

        
        func asin(z: CGFloat) -> CGFloat {
            _ = CGFloat.random(in: -2 ..< 2)
            return (z)
        }
        // VARIABLES
        let z = CGFloat.random(in: -2 ..< 2)
        let phi1 = CGFloat.random(in: 0 ..< pi*2)
        let phi2 = CGFloat.random(in: 0 ..< pi*2)
        let theta = asin(z: z/radius)
        
        // Different random value for each anchor point
        let randomDist1 = CGFloat.random(in: -1.35 ..< 1.35)
        let randomDist2 = CGFloat.random(in: -1.35 ..< 1.35)
        let randomDist3 = CGFloat.random(in: -1.35 ..< 1.35)
        let randomDist4 = CGFloat.random(in: -1.35 ..< 1.35)
        let randomDist5 = CGFloat.random(in: -1.35 ..< 1.35)
        let randomDist6 = CGFloat.random(in: -1.35 ..< 1.35)

        // 3D equivalent to coordinates on a circle
        let x1 = radius * cos(theta) * cos(phi1)
        let y1 = radius * cos(theta) * sin(phi1)
        let z1 = radius * sin(theta)
        let x2 = radius * cos(theta) * cos(phi2)
        let y2 = radius * cos(theta) * sin(phi2)
        let z2 = radius * sin(theta)
        
     // Overall method to draw a 2D bezier curve (example)

        func createLines() {
            var path: UIBezierPath
            path = UIBezierPath()
            
            let cyanMaterial = SCNMaterial()
            cyanMaterial.diffuse.contents = UIColor.green
            
            path.move(to: CGPoint(x: x1+randomDist1, y: y1+randomDist2))
            path.addLine(to: CGPoint(x: x2, y: y2))
            path.addLine(to: CGPoint(x: z1, y: z2))
            path.close()
            
            let shape = SCNShape(path: path, extrusionDepth: 0.75)
            shape.materials = [cyanMaterial]
            let shapeNode = SCNNode(geometry: shape)
            shapeNode.position = SCNVector3(x: 0.2, y: 0.75, z: 0.1);
            self.rootNode.addChildNode(shapeNode)
            shapeNode.rotation = SCNVector4(x: -1.0, y: -1.0, z: 0.0, w: 0.0)
        }
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
