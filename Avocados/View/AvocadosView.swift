//
//  AvocadosView.swift
//  Avocados
//
//  Created by Mohsen Abdollahi on 10/3/20.
//  Copyright © 2020 Mohsen Abdollahi. All rights reserved.
//

import SwiftUI

struct AvocadosView: View {
    //MARK:- PROPERTIES
    @State private var pulsateAnimation: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            
            Image("avocado")
                .resizable()
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
                .opacity(self.pulsateAnimation ? 1 : 0.9)
                .animation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true))
            
            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(Color.white)
                    .padding()
                    .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 8)
                
                Text("Creamy, green, and full of nutrients!\n Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!")
                    .lineLimit(nil)
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(Color("ColorGreenLight"))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .frame(maxWidth: 640, minHeight: 120)
            }.padding()
            
            Spacer()
        }
            //MARK:- VSTACK BACKGROUND
            .background(
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
        ).edgesIgnoringSafeArea(.all) //: VSTACK BACKGROUND
            
            .onAppear(perform: {
                self.pulsateAnimation.toggle()
            })
    }
}

struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView().environment(\.colorScheme, .dark)
    }
}
