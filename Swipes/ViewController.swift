//
//  ViewController.swift
//  Swipes
//
//  Created by esanchez on 4/8/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    private var gestureStartPoint: CGPoint!
    private static let minimumGestureLength = Float(25.0)
    private static let maximumVariance = Float(5)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            gestureStartPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let gestureStartPoint = self.gestureStartPoint {
            let currentPosition = touch.location(in: self.view)
            
            let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
            let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
            
            if deltaX >= ViewController .minimumGestureLength && deltaY <= ViewController.maximumVariance {
                label.text = "Horizontal swipe detected"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.label.text = ""
                }
            } else if deltaY >= ViewController.minimumGestureLength
                && deltaX <= ViewController.maximumVariance {
                label.text = "Vertical swipe detected"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.label.text = ""
                }
            }
        }
    }}

