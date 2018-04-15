//
//  ViewController+ARSCNViewDelegate.swift
//  ARKitHorizontalPlaneDemo
//
//  Created by Thinh Luong on 4/14/18.
//  Copyright © 2018 Jayven Nhan. All rights reserved.
//

import ARKit

extension ViewController: ARSCNViewDelegate {
  func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
    
    let width = CGFloat(planeAnchor.extent.x)
    let height = CGFloat(planeAnchor.extent.z)
    let plane = SCNPlane(width: width, height: height)
    
    plane.materials.first?.diffuse.contents = UIColor.transparentLightBlue
    
    let planeNode = SCNNode(geometry: plane)
    
    let x = CGFloat(planeAnchor.center.x)
    let y = CGFloat(planeAnchor.center.y)
    let z = CGFloat(planeAnchor.center.z)
    planeNode.position = SCNVector3(x, y, z)
    planeNode.eulerAngles.x = -.pi / 2
    
    node.addChildNode(planeNode)
  }
}
