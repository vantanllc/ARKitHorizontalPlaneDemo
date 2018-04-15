//
//  ViewController+AddShip.swift
//  ARKitHorizontalPlaneDemo
//
//  Created by Thinh Luong on 4/14/18.
//  Copyright © 2018 Jayven Nhan. All rights reserved.
//

import ARKit

extension ViewController {
  func addTapGestureToSceneView() {
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.addShipToSceneView(withGestureRecognizer:)))
    sceneView.addGestureRecognizer(tapGestureRecognizer)
  }
  
  @objc func addShipToSceneView(withGestureRecognizer recognizer: UIGestureRecognizer) {
    let tapLocation = recognizer.location(in: sceneView)
    let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
    
    guard let hitTestResult = hitTestResults.first else { return }
    
    let translation = hitTestResult.worldTransform.translation
    let x = translation.x
    let y = translation.y
    let z = translation.y
    
    guard let shipScene = SCNScene(named: "ship.scn"),
    let shipNode = shipScene.rootNode.childNode(withName: "ship", recursively: false) else { return }
    
    shipNode.position = SCNVector3(x, y, z)
    sceneView.scene.rootNode.addChildNode(shipNode)
  }
}

