//
//  TableViewController.swift
//  World
//
//  Created by APCMBP001 on 15/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,ExpandleHeaderViewDelegate{



    var isOpened:Bool = false


    @IBOutlet var tableview: UITableView!


    var sections = [
        section(Universitas: "Widyatama",
                NPM: [
                "0616101001","0616101002","0616101003","0616101004"
            ],
                Nama: [
                "Adli Raihan","Will Smith","Barrack Obama","Donald Trump"
            ],
                expanded: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].NPM.count
    }



    // Copy Paste

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableView()
        header.titleLabel.text = ""
        header.arrowLabel.text = ">"
        header.customInit(title: sections[section].Universitas, section: section, delegate: self)
        return header
    }



    //end


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "test") as! TableViewCell

        cell.labelNPM?.text = sections[indexPath.section].NPM[indexPath.row]
        cell.labelNama?.text = sections[indexPath.section].Nama[indexPath.row]

        return cell
    }


    func toggleSection(header: ExpandableView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        tableview.beginUpdates()

        for i in 0 ..< sections[section].Nama.count{
            tableview.reloadRows(at: [IndexPath(item: i, section: section)], with: .automatic)
        }
        tableview.endUpdates()

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
