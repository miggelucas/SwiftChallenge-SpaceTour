//
//  SwiftUIView.swift
//  
//
//  Created by Lucas Migge de Barros on 18/04/23.
//

import SwiftUI

struct TextContentView: View {
    
    let textString: String
    
    var body: some View {
        Text(textString)
            .foregroundColor(.accentColor)
            .font(.title)
            .lineSpacing(4)
            .padding(20)
            .background(.gray.opacity(0.6))
            .cornerRadius(20)
            .padding()
    }
}

struct TextContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextContentView(textString: "This is our solar system. Have you met all the plants? Our sun is the biggest star in this screen, located in the center. In order of proximity, we can now find Mercury (a bit rushed, don't you think), Venus, Earth (where we live), Mars, Jupiter, Saturn, Uranus and Neptune.")
    }
}
