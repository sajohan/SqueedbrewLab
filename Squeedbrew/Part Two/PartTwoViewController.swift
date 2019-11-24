//
//  PartTwoViewController.swift
//  Squeedbrew
//
//  Created by Johan Sandström on 2019-11-17.
//  Copyright © 2019 Squeed. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import RealityKit

class PartTwoViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BrewHelper.addCoachingView(toArView: arView)
        
        // Create an anchor that gets added to the scene when finding a 45x45 cm area
        let horizontalAnchor = AnchorEntity(plane: .horizontal, classification: .any, minimumBounds: [0.45, 0.45])
        arView.scene.addAnchor(horizontalAnchor)
        
        // Create and add a gameBoard as a child entity to the anchor
        let gameBoard = GameBoard()
        horizontalAnchor.addChild(gameBoard)
        
        // Register a TapGestureRecognizer that senses taps on the screen
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(sender:)))
        arView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func didTapView(sender: UITapGestureRecognizer) {
        // The tapped point (x,y) on the screen
        let tappedPoint = sender.location(in: arView)
    }
    
    @IBAction func didToggleDebug(_ sender: UISwitch) {
        if sender.isOn {
            BrewHelper.showDebugViews(onArView: arView)
        } else {
            BrewHelper.hideDebugViews(onArView: arView)
        }
    }
}
