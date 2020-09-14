//
//  SearchModel.swift
//  SearchBar_demo
//
//  Created by Leo on 2020/9/14.
//  Copyright © 2020 Leo. All rights reserved.
//

import Foundation
import SwiftUI



struct SearchSectionModel: Identifiable{
    var id = UUID()
    var title = ""
    var items = [itemModel()]
    var sIndex = 0
    var page = 0
}

struct itemModel: Identifiable{
    var id = UUID()
    var title = ""
    var subTitle = ""
    var price = 0.0
    var hightCount = false
}


 
