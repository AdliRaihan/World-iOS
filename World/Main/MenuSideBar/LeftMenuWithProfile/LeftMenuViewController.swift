//
//  LeftMenuViewController.swift
//  World
//
//  Created by APCMBP001 on 21/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var textVerified : UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.sd_setImage(with: URL(string: "https://images.unsplash.com/photo-1512036849132-48508f294900?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80"), completed: nil)
        imageProfile.layer.masksToBounds = false
        imageProfile.clipsToBounds = true

        textVerified.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
