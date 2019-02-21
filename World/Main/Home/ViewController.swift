//
//  ViewController.swift
//  World
//
//  Created by APCMBP001 on 15/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SDWebImage
import DropDown

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nil")!
        return cell
    }


    /* List of Outlets View   */
    @IBOutlet weak var header_image:UIImageView!
    @IBOutlet weak var box_register: UIView!
    @IBOutlet weak var box_register_modal: UIView!
    @IBOutlet weak var btn_join : UIButton!
    @IBOutlet weak var barButton: UIBarButtonItem!

    /* List of Outlets button */



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.




        /* Init Button DropDown*/
        dropDown.anchorView = box_register_modal
        dropDown.dataSource = ["adli","raihan"]
        dropDown.cellConfiguration = { (index, item) in return "\(item)" }
    }


    let dropDown = DropDown()

    override func viewDidAppear(_ animated: Bool) {
        /* First Initilialize */
        let urlImage:String = "https://images.unsplash.com/photo-1548561711-73eae96ad48d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=596&q=80"


        box_register.layer.cornerRadius  = 2.5
        box_register_modal.layer.shadowColor   = UIColor.black.cgColor
        box_register_modal.layer.shadowOpacity = 0.1
        box_register_modal.layer.shadowOffset  = CGSize.zero
        box_register_modal.layer.shadowRadius  = 2
        box_register_modal.layer.shouldRasterize = true

        header_image.sd_setImage(with: URL(string: urlImage)!, completed: nil)
        header_image.contentMode = UIViewContentMode.scaleAspectFill


    }

    @IBAction func viewShowbarApplication(_ sender:AnyObject){

        dropDown.selectionAction = { (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)") }

        dropDown.width = 140
        dropDown.bottomOffset = CGPoint(x:0,y:0)
//        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .any
        dropDown.show()
    }

}

