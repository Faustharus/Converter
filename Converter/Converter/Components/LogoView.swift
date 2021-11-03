//
//  LogoView.swift
//  Converter
//
//  Created by Damien Chailloleau on 03/11/2021.
//

import SwiftUI

struct LogoView: View {
    
    var image: String
    var textReview: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(25.0)
                .shadow(color: .black, radius: 8, x: 0.0, y: 0.0)
                .overlay(
                    ZStack(alignment: .bottom) {
                        Rectangle().foregroundColor(.clear)
                        VStack {
                            Text(textReview)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                )
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(image: "Watch", textReview: "Clock")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
