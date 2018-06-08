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

class ListViewController: UIViewController , UITableViewDataSource {
     //@IBOutlet var tableView : UITableView !
    func listingCocktailFromAPI(){
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail").responseJSON{ (response ) in

            if let value = response.result.value {
                let json = JSON(value)
                print(json["drinks"])
                
            } else {
                print(response.result.error)
            }

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview.dataSource = self
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
        return 10
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailsCell" , for :indexPath)
        return cell
    }
    
    
}

