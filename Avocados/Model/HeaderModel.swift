//
//  HeaderModel.swift
//  Avocados
//
//  Created by Mohsen Abdollahi on 10/9/20.
//  Copyright © 2020 Mohsen Abdollahi. All rights reserved.
//

import SwiftUI

//MARK:- HEADER MODEL

struct Header : Identifiable {
    
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
    
}
