//
//  InstructionsCell.swift
//  cocktailApp
//
//  Created by Bouznir on 08/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class InstructionsCell: UITableViewCell {

    @IBOutlet var cocktailInstruction : UILabel!
    
    func configure( cocktail : Cocktail ){
        cocktailInstruction.text = cocktail.instructions
    }

}
