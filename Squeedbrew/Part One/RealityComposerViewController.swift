//
//  RealityComposerViewController.swift
//  Squeedbrew
//
//  Created by Johan Sandström on 2019-11-17.
//  Copyright © 2019 Squeed. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import RealityKit

class RealityComposerViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHorizontalAnchor()
    }
    
    private func loadHorizontalAnchor() {
        // Load the "Horizontal" scene from the "Experience" Reality File
        let horizontalAnchor = try! Experience.loadHorizontal()
        
        // Add the horizontal anchor to the scene
        arView.scene.anchors.append(horizontalAnchor)
    }
    
    private func loadFaceAnchor() {
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Not supported on device")
        }
        
        let configuration = ARFaceTrackingConfiguration()
        arView.session.run(configuration, options: [])
        
        // Load the "Face" scene from the "Experience" Reality File
        let faceAnchor = try! Experience.loadFace()
        
        // Add the face anchor to the scene
        arView.scene.anchors.append(faceAnchor)
    }
    
    @IBAction func didToggleDebug(_ sender: UISwitch) {
        if sender.isOn {
            BrewHelper.showDebugViews(onArView: arView)
        } else {
            BrewHelper.hideDebugViews(onArView: arView)
        }
    }
}
