//
//  MenuSideViewController.swift
//  World
//
//  Created by APCMBP001 on 21/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SWRevealViewController

class MenuSideViewController: UIViewController {

    @IBOutlet weak var buttonNotification: UIBarButtonItem!
    @IBOutlet weak var menuSide: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        sideMenus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sideMenus(){
        if revealViewController() != nil {

            //Button (Target Button)
            menuSide.target = revealViewController()
            menuSide.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            //Notification (Right Button)
            buttonNotification.target = revealViewController()
            buttonNotification.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
