//
//  ContentView.swift
//  Avocados
//
//  Created by Mohsen Abdollahi on 10/2/20.
//  Copyright © 2020 Mohsen Abdollahi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK:- PROPERTIES
    var headers : [Header] = headersData
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20){
                
                //MARK:- HEADER
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0){
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                       
                    }
                }
                
                //MARK:- DISHES
                DishesView()
                
                //MARK:- FOOTER
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(8)
                    
                    Text("Everything you want to know about Avocados but were too afraid to ask!")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth:640)
                .padding()
                .padding(.bottom,85)
            }
            }.edgesIgnoringSafeArea(.all).padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData)
    }
}
