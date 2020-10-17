//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Mohsen Abdollahi on 10/16/20.
//  Copyright © 2020 Mohsen Abdollahi. All rights reserved.
//

import SwiftUI

struct RecipeCardView: View {
    
    //MARK:- PROPERTIES
    
    var recipe : Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundColor(Color.white)
                                .imageScale(.small)
                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                                .padding(.trailing,20)
                                .padding(.top,22)
                            Spacer()
                        }
                    }
                    
            ) //:overLay
            
            //TITLE
            VStack(alignment: .leading, spacing: 12){
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                //HEADLINE :
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(Color.gray)
                    .italic()
                //RATES
                HStack(alignment: .center, spacing: 5){
                    ForEach(1...(recipe.rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.body)
                            .foregroundColor(Color.yellow)
                    }
                }
                
                //COOKING
                HStack(alignment: .center, spacing: 12){
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "person")
                        Text("Serves: \(recipe.serves)")
                    }
                    
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "clock")
                        Text("Serves: \(recipe.preparation)")
                    }
                    
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "flame")
                        Text("Serves: \(recipe.cooking)")
                    }
                }
                .font(.footnote)
                .foregroundColor(Color.gray)
            }
            .padding()
            .padding(.bottom,12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentDark"), radius: 8, x: 0, y: 0)
        
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        //input Data
        RecipeCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
    }
}
