//
//  Cocktail.swift
//  cocktailApp
//
//  Created by Bouznir on 07/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit
import SwiftyJSON

class Cocktail: NSObject {
    var id:Int
    var name:String
    var url:String
    var glassType: String = ""
    var instructions: String = ""
    var ingredients: [(String , String )] = []
    
    init(_ json: JSON ) {
        self.id = json["idDrink"].intValue
        self.name = json["strDrink"].stringValue
        self.url = json["strDrinkThumb"].stringValue
    }
    func update( _ json : JSON ){
        
        for index in 1...15 {
            let ingredient = json["strIngredient\(index)"].stringValue
            let measure = json["strMeasure\(index)"].stringValue
            if ingredient != "" && ingredient != " "{
                self.ingredients.append(
                    (
                        ingredient ,
                        measure
                    )
                )
            }

        }
        self.instructions = json["strInstructions"].stringValue
        self.glassType = json["strGlass"].stringValue
        print(self.ingredients)
    }
}
