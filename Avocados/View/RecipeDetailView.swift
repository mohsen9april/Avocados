//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by Mohsen Abdollahi on 10/17/20.
//  Copyright © 2020 Mohsen Abdollahi. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    //MARK:- PROPERTIES
    var recipe : Recipe
    
    // Animation
    
    @State private var pulstate : Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                //IMAGE
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    
                    //TITLE
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    //RATING
                    RecipeRatingView(recipe: recipe)
                    //COOKING
                    RecipeCookingView(recipe: recipe)
                    //INGREDINETS
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .leading, spacing: 5){
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 5){
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    //INSTRUCTIONS
                    
                    Text("Instructions")
                        .fontWeight(.bold)
                    .modifier(TitleModifier())
                    
                    ForEach(recipe.instructions, id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            
                            Text(item)
                            .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }
                    }
                }
                .padding(.horizontal,24)
                .padding(.vertical, 12)
                
            }
        }.edgesIgnoringSafeArea(.top)
        .overlay(
        
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        //Action
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(Color.white)
                    })
                    
                        .opacity(self.pulstate ? 1 : 0.6)
                        .scaleEffect(self.pulstate ? 1.2 : 0.8, anchor: .center)
                        .animation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true))
                    
                }
                Spacer()
            }
            .padding(.trailing,20)
            .padding(.top, 24)
        )
        .onAppear(perform: {
            self.pulstate.toggle()
        })
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    }
}
