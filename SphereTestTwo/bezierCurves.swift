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

var num:Int = 7500
var rx = 0
var ry = 0
var dist = 135
let pi = Float.pi
var radius:Float = 200 //Dont change to CGFloat cause it breaks the asin() func.


class bezierCurves: UIBezierPath {
    
    override init() {
        super.init()
        
        var lineWidth: CGFloat // (stroke)
        
        func asin(z: CGFloat) -> CGFloat {
            _ = CGFloat.random(in: -200 ..< 200)
            return (z)
        }
    
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // VARIABLES
    let z = Float.random(in: -200 ..< 200)
    var phi1 = Float.random(in: 0 ..< pi*2)
    var phi2 = Float.random(in: 0 ..< pi*2)
    lazy var theta = asin(z/radius)
    
    // Different random value for each anchor point
    var randomDist1 = Float.random(in: -135 ..< 135)
    var randomDist2 = Float.random(in: -135 ..< 135)
    var randomDist3 = Float.random(in: -135 ..< 135)
    var randomDist4 = Float.random(in: -135 ..< 135)
    var randomDist5 = Float.random(in: -135 ..< 135)
    var randomDist6 = Float.random(in: -135 ..< 135)
    
}
