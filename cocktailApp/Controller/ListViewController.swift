//
//  ViewController.swift
//  cocktailApp
//
//  Created by Bouznir on 07/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    @IBOutlet var tableView : UITableView!
    var cocktails : [Cocktail] = []
    
    func listingCocktailFromAPI(){
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail").responseJSON{ (response ) in

            if let value = response.result.value {
                let json = JSON(value)
                for cocktailsJson in json["drinks"].arrayValue {
                    self.cocktails.append(Cocktail(cocktailsJson))
                }
                self.tableView.reloadData()
            } else {
                print(response.result.error!)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        listingCocktailFromAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //Access the array that you have used to fill the tableViewCell
        print(self.cocktails[indexPath.row])
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailsCell" , for : indexPath ) as! CocktailCell

        cell.configure( cocktail : cocktails[indexPath.row] )
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if let target = segue.destination as? DetailsCocktailsViewController {
            target.cocktail = cocktails[selectedPath.row]
        }
    }
    
    
}

