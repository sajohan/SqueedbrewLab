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
    }
    
    @IBAction func didToggleDebug(_ sender: UISwitch) {
        if sender.isOn {
            BrewHelper.showDebugViews(onArView: arView)
        } else {
            BrewHelper.hideDebugViews(onArView: arView)
        }
    }
}
