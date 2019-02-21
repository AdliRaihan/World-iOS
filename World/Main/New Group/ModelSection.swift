//
//  File.swift
//  World
//
//  Created by APCMBP001 on 18/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import Foundation

struct section{
    var Universitas:String
    var NPM: [String]
    var Nama: [String]
    var expanded : Bool

    init(Universitas:String,NPM:[String],Nama:[String],expanded:Bool) {
        self.Universitas = Universitas
        self.NPM = NPM
        self.Nama = Nama
        self.expanded = expanded
    }
}
