//
//  PartTwoViewController.swift
//  Squeedbrew
//
//  Created by Johan Sandström on 2019-11-17.
//  Copyright © 2019 Squeed. All rights reserved.
//

import Foundation
import UIKit
import RealityKit

class PartTwoViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
    
    @IBAction func didToggleDebug(_ sender: UISwitch) {
        if sender.isOn {
            BrewHelper.showDebugViews(onArView: arView)
        } else {
            BrewHelper.hideDebugViews(onArView: arView)
        }
    }
}
