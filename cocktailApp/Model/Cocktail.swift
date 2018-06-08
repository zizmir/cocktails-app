//
//  Cocktail.swift
//  cocktailApp
//
//  Created by Bouznir on 07/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class Cocktail: NSObject {
    var id:Int
    var name:String
    var url:String
    
    init(_ id : Int , _ name: String , url : String ) {
        self.id = id
        self.name = name
        self.url = url
    }
}
