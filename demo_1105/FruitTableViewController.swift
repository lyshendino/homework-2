//
//  FruitTableViewController.swift
//  demo_1105
//
//  Created by NDHU_CSIE on 2020/11/5.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class FruitTableViewController: UITableViewController {
    
    @IBOutlet var myLabel:UILabel!
    
    var items = ["watermellon","apple","orange","strawberry","pear"]
    var price = ["500","100","90","200","150"]
    var fruitIsVisited = Array(repeating: false, count: 5)
    var sum:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FruitTableViewCell

        // Configure the cell...
        cell.name.text = items[indexPath.row]
        cell.price.text = price[indexPath.row]
        cell.imageView?.image = UIImage(named: "fruit")
        
        if fruitIsVisited[indexPath.row] {
        cell.accessoryType = .checkmark
        } else {
        cell.accessoryType = .none
        }

        cell.accessoryType = fruitIsVisited[indexPath.row] ? .checkmark : .none


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if self.fruitIsVisited[indexPath.row]
        {
            cell?.accessoryType = .none
            self.fruitIsVisited[indexPath.row] = false
            sum = sum - Int(price[indexPath.row])!
        }
        else
        {
            cell?.accessoryType = .checkmark
            self.fruitIsVisited[indexPath.row] = true
            sum = sum + Int(price[indexPath.row])!
        }

        myLabel.text = " Total prices = \(sum)"
        //myLabel.text = "Total prices = \(sum)"
    }

}
