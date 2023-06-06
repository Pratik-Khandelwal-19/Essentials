//
//  ItemsTableViewController.swift
//  Essentials
//
//  Created by Mac on 06/06/23.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    //MARK: Vars
    var category: Category?
    var itemArray: [Item] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = category?.name

    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
}
