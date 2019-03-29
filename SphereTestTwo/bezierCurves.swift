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

func createVector(_ lol: SCNVector3) -> SCNVector3 {
    let length = sqrt(lol.x * lol.x + lol.y * lol.y + lol.z + lol.z)
    if length == 0 {
        return SCNVector3(0.0, 0.0, 0.0)
    }
    return SCNVector3(lol.x / length, lol.y / length, lol.z / length)
}


        
extension SCNNode {
    func bezierCurves(from startPoint: SCNVector3,
                      to endPoint: SCNVector3,
                      radius: CGFloat,
                      color: UIColor) -> SCNNode {
        
       
        var lineWidth: CGFloat = 1// (stroke)
        
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
        
        let w = SCNVector3(x: endPoint.x-startPoint.x,
                           y: endPoint.y-startPoint.y,
                           z: endPoint.z-startPoint.z)
        let l = CGFloat(sqrt(w.x * w.x + w.y * w.y + w.z * w.z))
       
        if l == 0.0 {
            //two  points together
            let sphere = SCNSphere(radius: radius)
            sphere.firstMaterial?.diffuse.contents = color
            self.geometry = sphere
            self.position = startPoint
            return self
        }
        
        let cylinder = SCNCylinder(radius: radius, height: l)
        cylinder.firstMaterial?.diffuse.contents = color
        self.geometry = cylinder
        
        //original vector of cylinder above 0,0,0
        let originalVector = SCNVector3(0, l/2.0, 0)
        //target vector, in new coordination
        let newVector = SCNVector3((endPoint.x - startPoint.x)/2.0,
                                   (endPoint.y - startPoint.y)/2.0,
                                   (endPoint.z - startPoint.z)/2.0)
        
        //axis between two vectors
        let vectorAxis = SCNVector3((originalVector.x+newVector.x)/2.0,
                                    (originalVector.y+newVector.y)/2.0,
                                    (originalVector.z+newVector.z)/2.0)
        
        
        
        return self
    }
}

            
        

    

    

        
        




    

