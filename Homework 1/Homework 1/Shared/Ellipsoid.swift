//
//  Ellipsoid.swift
//  Homework 1
//
//  Created by Derek Rhea on 1/27/21.
//

import SwiftUI

class Ellipsoid: NSObject, ObservableObject {
 
    var aAxis = 0.0
    var bAxis = 0.0
    var cAxis = 0.0
    @Published var ellipsoidVolume = 0.0
    @Published var ellipsoidArea = 0.0
    @Published var boxVolume = 0.0
    @Published var boxArea = 0.0
    //@ObservedObject private var sphereModel = Sphere()
    
    func defineAxes(majorAxis: Double, semiAxis: Double, minorAxis: Double) -> (String,String,String,String){
        
        aAxis = majorAxis
        bAxis = semiAxis
        cAxis = minorAxis
        
        let results1 = ellipsoidStats(majorAxis: aAxis, semiAxis: bAxis, minorAxis: cAxis)
        let results2 = boxStats(majorAxis: aAxis, semiAxis: bAxis, minorAxis: cAxis)
        
        return(results1.0,results1.1,results2.0,results2.1)
    }
    
    func ellipsoidStats(majorAxis: Double, semiAxis: Double, minorAxis: Double)->(String,String){
        
        let ellipsoidVolume = (4.0/3.0) * Double.pi * majorAxis * semiAxis * minorAxis
        let volText: String = String(ellipsoidVolume)
        
        let ellipsoidArea = 4.0 * Double.pi *
            pow((pow(majorAxis*semiAxis, 1.6) + pow(minorAxis*semiAxis, 1.6) + pow(minorAxis*majorAxis, 1.6))/3,1.0/1.6)
        let areaText: String = String(ellipsoidArea)
        
        return(volText,areaText)
        
    }
    
    func boxStats(majorAxis: Double, semiAxis: Double, minorAxis: Double) -> (String,String){
        
        let boxVolume = 8.0 * majorAxis * semiAxis * minorAxis
        let volText: String = String(boxVolume)
            
        let boxArea = 8.0 * (majorAxis*semiAxis + semiAxis*minorAxis + majorAxis*minorAxis)
        let areaText: String = String(boxArea)
        
        return(volText,areaText)
    }
    
    
    
}
