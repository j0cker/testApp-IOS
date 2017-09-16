//
//  MealTableViewController.swift
//  firstApp
//
//  Created by j0cker on 09/09/17.
//  Copyright © 2017 j0cker. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    //MARK: Properties
    //meal es the external class from the data model
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleMeals()
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? MealViewController, let meal = sourceViewController.meal {
            
            NSLog("MealTableViewController unwindToMealList")
            
            // Add a new meal.
            
            //swift3
            //let newIndexPath = IndexPath(row: meals.count, section: 0)
            
            let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
            
            //new meal will be inserted
            meals.append(meal)
            //new row to the table
            //.automatic animation option uses the best animation based on the table’s current state, and the insertion point’s location.
            //swift3
            //tableView.insertRows(at: [newIndexPath], with: .automatic)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            
            
        }
    }
    
    private func loadSampleMeals() {
        
        NSLog("MealTableViewController loadSampleMeals")
        
        
        let photo1 = UIImage(named: "Image")
        let photo2 = UIImage(named: "Image")
        let photo3 = UIImage(named: "Image")
        
        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        meals += [meal1, meal2, meal3]
        NSLog("MealTableViewController loadSampleMeals fin")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        NSLog("MealTableViewController numberOfSectionsInTableView inicio")
        
        //This code makes the table view show 1 section instead of 0.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        NSLog("MealTableViewController tableView numberOfRowsInSection inicio")
        
        //return the appropriate number of rows to the table view
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        NSLog("MealTableViewController tableView inicio")
        
        //
        //requests a cell from the table view. Instead of creating new cells and deleting old cells as the user scrolls, the table tries to reuse the cells when possible.
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        //NSLog("MealTableViewController tableView " + indexPath.indexAtPosition(0).description)
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]
        
        NSLog("MealTableViewController tableView " + meal.name)
        
        cell.label.text = meal.name
        cell.image2.image = meal.photo
        cell.rating.rating = meal.rating
        
        
        NSLog("MealTableViewController tableView fin")
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
