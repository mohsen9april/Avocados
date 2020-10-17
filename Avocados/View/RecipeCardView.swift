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
    var hapticImpact = UIImpactFeedbackGenerator(style: .light)
    @State private var showModel : Bool = false
    
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
                RecipeRatingView(recipe: recipe)
                
                //COOKING
                RecipeCookingView(recipe: recipe)
                
            }
            .padding()
            .padding(.bottom,12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentDark"), radius: 8, x: 0, y: 0)
        
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showModel = true
        }.sheet(isPresented: self.$showModel) {
            RecipeDetailView(recipe: self.recipe)
        }  
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        //input Data
        RecipeCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
    }
}
