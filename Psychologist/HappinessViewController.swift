//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Raju on 15/06/2015.
//  Copyright (c) 2015 Damodar Gundu. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
    
 
        
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            
        let translation = gesture.translationInView(faceView)
        let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
        if happinessChange != 0 {
            happiness += happinessChange
            gesture.setTranslation(CGPointZero, inView: faceView)
            }
            
        default: break
        }
    }
    
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
           faceView.dateSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
  
        }
    }

    var happiness: Int = 35 { // 0 = very sad, 70 = ecstatic
    didSet {
        happiness = min(max(happiness, 25), 47)
        println ("happiness= \(happiness)")
        updateUI()
    }
    
  }

    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-35)/35
    }
    
    
}