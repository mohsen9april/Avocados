//
//  RecipeCookingView.swift
//  Avocados
//
//  Created by Mohsen Abdollahi on 10/17/20.
//  Copyright © 2020 Mohsen Abdollahi. All rights reserved.
//

import SwiftUI

struct RecipeCookingView: View {
    
    //MARK:- PROPERTIES
    
    var recipe : Recipe
    
    var body: some View {
        
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
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(recipe: recipesData[0])
    }
}
