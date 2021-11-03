//
//  VolumeView.swift
//  Converter
//
//  Created by Damien Chailloleau on 02/11/2021.
//

import SwiftUI

struct VolumeView: View {
    
    @State private var inputValue: Double = 0
    
    @State private var inputPosition: Int = 0
    @State private var outputPosition: Int = 1
    
    @FocusState private var isFocused: Bool
    
    let valuesUnit: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    let namesUnit = ["Millilts", "Lts", "Cups", "Pints", "Gallons"]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack {
            Image("VolumeBack")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 8.0)
            VStack {
                Form {
                    Section(header: Text("Value to Convert").foregroundColor(.white)) {
                        HStack {
                            TextField("", value: $inputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                            
                            Text("\(namesUnit[inputPosition])")
                        }
                    }
                    
                    Section(header: Text("Input Selection").foregroundColor(.white)) {
                        Picker("", selection: $inputPosition) {
                            ForEach(0 ..< valuesUnit.count) { input in
                                Text(namesUnit[input])
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("Output Selection").foregroundColor(.white)) {
                        Picker("", selection: $outputPosition) {
                            ForEach(0 ..< valuesUnit.count) { output in
                                Text(namesUnit[output])
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("Result").foregroundColor(.white)) {
                        HStack {
                            Text("\(volumeConversions, specifier: "%.2f")")
                            Spacer()
                            Text("\(namesUnit[outputPosition])")
                        }
                    }
                    
                    
                }
                .navigationTitle("Converter")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
            }
        }
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VolumeView()
        }
    }
}


// MARK: - Computed Properties
extension VolumeView {
    
    var volumeConversions: Double {
        let initialValue = inputValue
        let operationValue = valuesUnit[inputPosition]
        let outputOperation = valuesUnit[outputPosition]
        let litersValue = Measurement(value: initialValue, unit: operationValue)
        let convertedValue = litersValue.converted(to: outputOperation)
        return convertedValue.value
    }
    
}
