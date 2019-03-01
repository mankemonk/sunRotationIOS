//
//  ViewController.swift
//  SphereTestTwo
//
//  Created by Théo Germain on 25/02/2019.
//  Copyright © 2019 Théo Germain. All rights reserved.
//

import UIKit
import SceneKit

// voir pour mettre sur github

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = self.view as! SCNView
        scnView.scene = FirstScene()
        scnView.backgroundColor = UIColor.black
        
        scnView.autoenablesDefaultLighting = true
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        
       
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
//    override func viewDidAppear(_ animated: Bool) {
//
//        super.viewDidAppear(animated)
//
//        let width: CGFloat = 240.0
//        let height: CGFloat = 160.0
//
//        let demoView = CurvesBez(frame: CGRect(x: self.view.frame.size.width/2 - width/2,       // THATS FOR DISPLAYING BEZIER CURVES (Add a z parameter)
//                                              y: self.view.frame.size.height/2 - height/2,
//                                              width: width,
//                                              height: height))
//
//        self.view.addSubview(demoView)
//    }


}

