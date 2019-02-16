//
//  MainTableViewController.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/15/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    

    var storage = Storage()
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storage.mainMenu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        let font = UIFont.preferredFont(forTextStyle: .headline)
        let textColor = UIColor(red: 0.175, green: 0.458, blue: 0.831, alpha: 1.0)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: textColor, .font: font, .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle]
        let attributedString = NSAttributedString(string: storage.mainMenu[indexPath.row], attributes: attributes)
        cell.textLabel?.attributedText = attributedString
        cell.selectionStyle = .blue
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        Storage.changeValue = indexPath.row
    }

}
