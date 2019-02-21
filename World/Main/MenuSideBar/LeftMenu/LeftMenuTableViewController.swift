//
//  LeftMenuTableViewController.swift
//  World
//
//  Created by APCMBP001 on 21/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class LeftMenuTableViewController: UITableViewController {


    //List Of Menu

    var Sections = [
        listOfMenu(labelButton: "1", labelText: "Lihat Practice 1"),
        listOfMenu(labelButton: "2", labelText: "Lihat Practice 2"),
        listOfMenu(labelButton: "3", labelText: "Lihat Practice 3"),
        listOfMenu(labelButton: "4", labelText: "Lihat Practice 4"),
        listOfMenu(labelButton: "5", labelText: "Lihat Practice 5")
    ]

    //Variables
    @IBOutlet weak var tableLeft:UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    //
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return Sections.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Sections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuserLeftMenu", for: indexPath) as! LeftMenuTableViewCell

        let tapper = tapGesture(target: self, action: #selector(pindahVC(_:)))
        tapper.sectionMenu = Sections[indexPath.row].labelButton

        cell.labelButton.setTitle(Sections[indexPath.row].labelButton, for: UIControlState.normal)
        cell.labelText.text = Sections[indexPath.row].labelText
        cell.addGestureRecognizer(tapper)

        return cell
    }

    @objc func pindahVC(_ Sender:tapGesture){
        print("\(Sender.sectionMenu) : Sender Halo?")
        switch Int(Sender.sectionMenu) {
        case 1:
            let homeController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Homer") as? HomeControllerViewController
            self.present(homeController!, animated: true, completion: nil)
            break
        default:
            break
        }
    }

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class tapGesture : UITapGestureRecognizer{
    var sectionMenu = String()
}
