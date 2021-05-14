//
//  ContentView.swift
//  Shared
//
//  Created by Derek Rhea on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var radString = "1.0"
    @ObservedObject private var sphereModel = Sphere()
    
    var body: some View {
        Text("Spherical Dimensions")
            .padding()
        VStack{
            // Defines radius of sphere and presents it
            
            Text("Radius = " + radString)
                .padding()
            TextField("Enter Radius", text: $radString)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            let rad = (radString as NSString).doubleValue
            
            let result = calcDimensions(radius: rad)
            let sphereVol = result.0
            let sphereSA = result.1
            let boxVol = result.2
            let boxSA = result.3
            
            
            // Defines volume of sphere and presents it
            
            //let sphVolStr: String = String(sphereVol)
            Text("Sphere Volume = " + sphereVol)
                .padding()
            
            // Defines surface area of sphere and presents it
            
            //let sphSAStr: String = String(sphereSA)
            Text("Sphere Surface Area = " + sphereSA)
                .padding()
            
            // Defines volume of bounding box and presents it
            
            //let boxVolStr: String = String(boxVol)
            Text("Bounding Box Volume = " + boxVol)
                .padding()
            
            // Defines surface area of bounding box and presents it
            
            //let boxSAStr: String = String(boxSA)
            Text("Bounding Box Surface Area = " + boxSA)
                .padding()
        }
    
    }
    
    func calcDimensions(radius: Double) -> (String,String,String,String){
        let sphereResults = sphereModel.defineRadius(axis: radius)
        
        return (sphereResults.0, sphereResults.1, sphereResults.2, sphereResults.3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
