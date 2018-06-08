//
//  DetailsCocktailsViewController.swift
//  cocktailApp
//
//  Created by Bouznir on 08/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailsCocktailsViewController: UIViewController , UITableViewDataSource{
    
    @IBOutlet var tableView : UITableView!
    
    var cocktail: Cocktail!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        listingCocktailFromAPI()
        // register
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func listingCocktailFromAPI(){
        guard let id = cocktail?.id else {
            return
        }
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)").responseJSON{ (response ) in
            
            if let value = response.result.value {
                let json = JSON(value)
                self.cocktail.update(json["drinks"].arrayValue.first!)
                self.tableView.reloadData()
            } else {
                print(response.result.error!)
            }
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Ingredients"
        case 2:
            return "Instructions"
        default:
            return nil
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            
            return 1
        case 1 :
            return cocktail.ingredients.count
            
        case 2 :
            return 1
            
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCocktailCell", for: indexPath) as! HeaderCell
            cell.configure( cocktail : cocktail )
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCocktailCells", for: indexPath) as! IngredientsCell
            cell.configure( cocktail.ingredients[indexPath.row] )
            return cell
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionsCocktailCells", for: indexPath) as! InstructionsCell
             cell.configure( cocktail : cocktail )
            return cell
        default:
            return UITableViewCell()
        }
    }

}
