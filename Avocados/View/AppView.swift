//
//  AppView.swift
//  Avocados
//
//  Created by Mohsen Abdollahi on 10/3/20.
//  Copyright © 2020 Mohsen Abdollahi. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            //1.
            AvocadosView()
            .tabItem({
                Image("tabicon-branch")
                Text("Avocados")
            })
            //2.
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            //3.
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripenings")
                })
            //4.
            SettingsView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Setting")
                })  
        }
//        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
