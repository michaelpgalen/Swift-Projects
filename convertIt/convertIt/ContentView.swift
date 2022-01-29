//
//  ContentView.swift
//  convertIt
//
//  Created by Michael Galen on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0.0
    @State private var inputUnit = "feet"
    @State private var outputUnit = "meters"
    
    let units = ["feet", "meters", "yards", "kilometers", "miles"]
    
    var convertedValue: Double {
        var baseFoot: Double {
            switch inputUnit {
            case "feet":
                return inputValue
            case "meters":
                return inputValue * 3.281
            case "yards":
                return inputValue * 3
            case "kilometers":
                return inputValue * 3280.84
            default:
                return inputValue * 5280
            }
                
            
            //if inputUnit == "feet" {
              //  return inputValue
            //} else if inputUnit == "meters" {
              //  return inputValue * 3.281
            //} else if inputUnit == "yards" {
              //  return inputValue * 3
            //} else if inputUnit == "kilometers" {
              //  return inputValue * 3280.84
            //} else {
              //  return inputValue * 5280
            //}
        }
        
        var finalConversion: Double {
            switch outputUnit {
            case "feet":
                return baseFoot
            case "meters":
                return baseFoot * 0.3048
            case "yards":
                return baseFoot / 3
            case "kilometers":
                return baseFoot / 3281
            default:
                return baseFoot / 5280
            }
        }
            
            //if outputUnit == "feet" {
              //  return baseFoot
            //} else if outputUnit == "meters" {
              //  return baseFoot * 0.3048
            //} else if outputUnit == "yards" {
              //  return baseFoot / 3
            //} else if outputUnit == "kilometers" {
              //  return baseFoot / 3281
            //} else {
              //  return baseFoot / 5280
            //}
        
        return finalConversion
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Initual Value", value: $inputValue, format: .number)
                    Picker("Initial Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                }
                
                Section {
                    Text(convertedValue, format: .number)
                    Picker("Conversion Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Equals")
                }
                
            } .navigationTitle("convertIt")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
