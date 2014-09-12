//
//  MotionController.swift
//  ROM-Test
//
//  Created by David Fry on 9/11/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion


protocol MotionControllerProtocol
{
    func motionDataAvailable(yaw:Double, pitch:Double, roll:Double)
}

class MotionController: NSObject
{
    var delegate: MotionControllerProtocol?
    
    func getGyroData(motionManager:CMMotionManager)
    {
        motionManager.startDeviceMotionUpdates()
        
        if (motionManager.deviceMotionAvailable)
        {
            motionManager.deviceMotionUpdateInterval = 1.0/60.0
            
            var queue = NSOperationQueue.currentQueue()
            
            motionManager.startDeviceMotionUpdatesToQueue(queue, withHandler:
                {
                    deviceManager, error in
                    var attitude = motionManager.deviceMotion.attitude
                    //self.delegate?.motionDataAvailable(attitude.yaw * 180 / M_PI, pitch: attitude.pitch * 180 / M_PI, roll: attitude.roll * 180 / M_PI)
                    self.delegate?.motionDataAvailable(attitude.yaw, pitch: self.radiansToDegrees(attitude.pitch), roll: attitude.roll)
                    
                    if (error != nil)
                    {
                        println("\(error)")
                    }
                    
            })
        }
        else
        {
            var alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Could not find: Accelaromter, Gyroscope."
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
    
    func radiansToDegrees(radians:Double) ->Double
    {

        var degrees = (radians * M_PI)
        
        return degrees
    }
    
}
