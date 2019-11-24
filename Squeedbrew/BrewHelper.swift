//
//  BrewHelper.swift
//  Squeedbrew
//
//  Created by Johan Sandström on 2019-11-17.
//  Copyright © 2019 Squeed. All rights reserved.
//

import Foundation
import ARKit
import RealityKit
import Combine

struct BrewHelper {
    
    // MARK: Coaching view
    static func addCoachingView(toArView arView: ARView) {
        // Create
        let coachingView = ARCoachingOverlayView()
        coachingView.goal = .horizontalPlane
        coachingView.activatesAutomatically = true
        coachingView.session = arView.session
        
        // Add to ARView
        arView.addSubview(coachingView)
        
        // Layout
        coachingView.translatesAutoresizingMaskIntoConstraints = false
        coachingView.leadingAnchor.constraint(equalTo: arView.leadingAnchor, constant: 0).isActive = true
        coachingView.topAnchor.constraint(equalTo: arView.topAnchor, constant: 0).isActive = true
        arView.trailingAnchor.constraint(equalTo: coachingView.trailingAnchor, constant: 0).isActive = true
        arView.bottomAnchor.constraint(equalTo: coachingView.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: Hiding and showing debug
    static func showDebugViews(onArView arView: ARView) {
        arView.debugOptions = [.showAnchorGeometry,
                               .showAnchorOrigins,
                               .showFeaturePoints,
                               .showPhysics,
                               .showWorldOrigin]
    }
    
    static func hideDebugViews(onArView arView: ARView) {
        arView.debugOptions = []
    }
    
    // MARK: Grid positioning
    static func getPosition(fromIndex index: Int, cardWidth: Float) -> SIMD3<Float> {
        let cardSpacing: Float = 0.01
        let xPosition = (Float(index % 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        let zPosition = (Float(index / 4) * (cardWidth + cardSpacing)) - cardWidth * 1.5
        return [Float(xPosition), 0, Float(zPosition)]
    }
    
    // MARK: Loading 3D models
    static var loadRequest: AnyCancellable?
    static func loadModels(completed: @escaping ([ModelEntity]) -> Void) {
        loadRequest = Entity.loadModelAsync(named: "chair_swan")
            .append(Entity.loadModelAsync(named: "fender_stratocaster"))
            .append(Entity.loadModelAsync(named: "gramophone"))
            .append(Entity.loadModelAsync(named: "teapot"))
            .append(Entity.loadModelAsync(named: "toy_biplane"))
            .append(Entity.loadModelAsync(named: "toy_car"))
            .append(Entity.loadModelAsync(named: "toy_drummer"))
            .append(Entity.loadModelAsync(named: "tv_retro"))
            .append(Entity.loadModelAsync(named: "toy_robot_vintage"))
            .collect()
            .sink(receiveCompletion: { receiveCompletion in
                // Do nothing
            }) { (models) in
                completed(models)
        }
    }
    
    static func setMaxBaseWidth(_ width: Float, forModelEntity entity: ModelEntity) {
        let xDimension = entity.model!.mesh.bounds.extents.x
        let zDimension = entity.model!.mesh.bounds.extents.z
        let maxWidth = Float.maximum(xDimension, zDimension)
        let scale = width / maxWidth
        entity.scale = [scale, scale, scale]
    }
}
