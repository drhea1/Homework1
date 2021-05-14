//
//  Sphere.swift
//  Homework 1
//
//  Created by Derek Rhea on 1/27/21.
//

import SwiftUI

class Sphere: Ellipsoid {
    
    var radius = 0.0
    //@Published var sphereVolume = 0.0
    //@Published var sphereArea = 0.0
    //private var boxVolume = 0.0
    //private var boxArea = 0.0
    
    func defineRadius(axis: Double) -> (String,String,String,String){
        radius = axis
        let results1 = sphereStats(axis: radius)
        let results2 = boxStats(axis: radius)
        
        return (results1.0,results1.1,results2.0,results2.1)
    }
    
    func sphereStats(axis: Double) -> (String,String){
        let sphereVolume = (4.0/3.0) * Double.pi * pow(radius,3)
        let volText: String = String(sphereVolume)
        let sphereArea = 4.0 * Double.pi * pow(radius,2)
        let areaText: String = String(sphereArea)
        
        return(volText,areaText)
    }
    
    func boxStats(axis: Double) -> (String,String) {
        let boxVolume = 8.0 * pow(radius,3)
        let volText: String = String(boxVolume)
        let boxArea = 24.0 * pow(radius,2)
        let areaText: String = String(boxArea)
        
        return(volText,areaText)
    }
    
}
