//
//  MainTableViewController.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/15/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    

    let storage = Storage()
    
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
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //        guard let goToCompare = segue.destination as? ViewController else { return }
//        //        guard let calculator = segue.destination as? CompareViewController else { return }
//        
//        if Segue.compare == segue.identifier {
//            
//        } else if Segue.calculator == segue.identifier {
//            
//            
//        }
//        
//        //        let viewController:ViewController = segue!.destinationViewController as ViewController
//        //        let indexPath = self.tableView.indexPathForSelectedRow()
//        //        viewController.pinCode = self.exams[indexPath.row]
//        //            if let path = tableView.indexPathForSelectedRow {
//        //                calculator.storage = storage.mainMenu[path.row]
//        //            }
//        //            tableView.indexPathForSelectedRow
//    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
