//
//  ClockView.swift
//  Converter
//
//  Created by Damien Chailloleau on 02/11/2021.
//

import SwiftUI

struct ClockView: View {
    
    @State private var inputValue: Double = 0
    
    @State private var inputPosition: Int = 0
    @State private var outputPosition: Int = 1
    
    @FocusState private var isFocused: Bool
    
    let valuesUnit: [UnitDuration] = [.seconds, .minutes, .hours, .seconds]
    
    let namesUnit = ["Seconds", "Minutes", "Hours", "Days"]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack {
            Image("WatchBack")
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
                            Text("\(clockConversions, specifier: "%.2f")")
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

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClockView()
        }
    }
}


// MARK: - Computed Properties
extension ClockView {
    
    var clockConversions: Double {
        let initialValue = inputValue
        let operationValue = valuesUnit[inputPosition]
        let outputOperation = valuesUnit[outputPosition]
        let timesValue = Measurement(value: initialValue, unit: operationValue)
        let convertedValue = timesValue.converted(to: outputOperation)
        if inputPosition == 3 && outputPosition == 3 {
            return initialValue
        } else if outputPosition == 3 {
            return initialValue / 86400.0
        } else if inputPosition == 3 {
            return convertedValue.value * 86400.0
        } else {
            return convertedValue.value
        }
    }
    
}
