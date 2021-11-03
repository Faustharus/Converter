//
//  ContentView.swift
//  Converter
//
//  Created by Damien Chailloleau on 02/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            ScrollView {
                HStack {
                    NavigationLink(destination: LengthView()) {
                        LogoView(image: "Length", textReview: "Length")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: TemperatureView()) {
                        LogoView(image: "Temperature", textReview: "Temperature")
                    }
                }
                .padding(.all, 20)
                
                HStack {
                    NavigationLink(destination: VolumeView()) {
                        LogoView(image: "Volume", textReview: "Volume")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ClockView()) {
                        LogoView(image: "Watch", textReview: "Clock")
                    }
                }
                .padding(.all, 20)
                
                Text("More to come")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
        }
        .navigationBarTitle("Converter")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
