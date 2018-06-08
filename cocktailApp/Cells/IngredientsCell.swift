//
//  IngredientsCell.swift
//  cocktailApp
//
//  Created by Bouznir on 08/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class IngredientsCell: UITableViewCell {
    
    @IBOutlet var cocktailIngredients : UILabel!
    @IBOutlet var cocktailMeasure : UILabel!
    
    func configure( _ ingredients : (String, String) ){
        cocktailIngredients.text = ingredients.0
        cocktailMeasure.text = ingredients.1
    }

}
