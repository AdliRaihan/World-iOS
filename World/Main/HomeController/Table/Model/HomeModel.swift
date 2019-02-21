//
//  HomeModel.swift
//  World
//
//  Created by APCMBP001 on 20/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation

struct priceInformation{
    var paket : String
    var paket_model : [String]
    var paket_harga : Int
    var paket_Available : String
    var Expanded : Bool

    init(paket:String,
         paket_model:[String],
         paket_harga : Int,
         paket_available : String,
         Expanded:Bool) {
        self.paket = paket
        self.paket_model = paket_model
        self.paket_harga = paket_harga
        self.paket_Available = paket_available
        self.Expanded = Expanded
    }
}
