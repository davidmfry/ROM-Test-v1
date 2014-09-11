//
//  ViewController.swift
//  ROM-Test
//
//  Created by David Fry on 9/11/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, MotionControllerProtocol
{

    @IBOutlet var yawLabel: UILabel!
    @IBOutlet var pitchLabel: UILabel!
    @IBOutlet var rollLabel: UILabel!
    
    @IBOutlet var tenthLabel: UILabel!
    @IBOutlet var wholeNumberLabel: UILabel!
    
    let motionManager = CMMotionManager()
    let motionController = MotionController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.motionController.delegate = self
        self.motionController.getGyroData(motionManager)
        
    }
    
    func motionDataAvailable(yaw: Double, pitch:Double, roll:Double)
    {
        self.yawLabel.text = NSString(format:"%.2f", yaw)
        self.pitchLabel.text = NSString(format:"%.2f", pitch)
        self.rollLabel.text = NSString(format:"%.2f", roll)
        
        self.wholeNumberLabel.text = NSString(format:"%.0f", pitch)
        self.tenthLabel.text = NSString(format:"%.2f", pitch)
    }


}

