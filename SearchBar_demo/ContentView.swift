//
//  ContentView.swift
//  SearchBar_demo
//
//  Created by Leo on 2020/9/14.
//  Copyright © 2020 Leo. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    @State var text:String?
    var body: some View {
        
 
        //创建view 并设置数据，假定json 数据已经转化模型，需要根据json 数据转换model
        SearchPage(
            
            SearchSections: [
                SearchSectionModel(title: "Vacuum",
                                   items:[itemModel(title:"V11",
                                                    subTitle: "In-stock",
                                                    price: 500.99,
                                                    hightCount:true
                                    ),
                                          itemModel(title:"V10",
                                                    subTitle: "Out-of-stock",
                                                    price: 399.99,
                                                    hightCount: false)]),
                
                SearchSectionModel(title: "Hair Dryer",
                                   items: [itemModel(title:"Supersonic",
                                                     subTitle: "In-stock",
                                                     price: 500.99,
                                                     hightCount: false
                                    )]),
             
                
        ]
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


