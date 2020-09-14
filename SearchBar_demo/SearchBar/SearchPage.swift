//
//  SearchPage.swift
//  SearchBar_demo
//
//  Created by Leo on 2020/9/14.
//  Copyright © 2020 Leo. All rights reserved.
//

import SwiftUI

struct SearchPage: View {
    
    var SearchSections: [SearchSectionModel]
 
    
    //搜索参数key
    @State  var searchKey: String?
    @State  var page = 1

    
    
    //筛选搜索参数key 是否在数据数组中，并展示，否则不显示。
    var predicate: (SearchSectionModel) -> Bool {
        print("predicate: \(String(describing: searchKey))")
        if let searchKey = searchKey {
       
            return { sections in
                if searchKey == "Dyson"{
                        return   true
                }else{
                  return  false
                }
            }
        }
        else {
            return { _ in false }
        }
    }
    
    var body: some View {
        
        NavigationView {
            if (self.SearchSections.filter(self.predicate).count != 0){
                List{
                    ForEach(self.SearchSections.filter(self.predicate)) { (sectionModel:SearchSectionModel)  in
                        Section(header: Text(sectionModel.title)
                            .font(.system(size: 16))
                            .foregroundColor(Color.gray)
                        ){
                            ForEach(sectionModel.items) { (item:itemModel)  in
                                ItemView( item: item, buttonAction: {
                                    print("cell点击 \(item.id)")
                                })
                            }
                        }
                    }
                }.padding(.top,44)
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Search")
                    .navigationSearchBar(
                        searchKey: $searchKey
                )
            }else{
                if Coordinator.st_searchController.isActive == true{
                    // 没有搜索结果
                    HStack{
                        VStack {
                            if self.searchKey?.count != 0{
                                Text("No result")
                                .padding(.top,100)
                                Spacer()
                            }else{
                                Spacer()
                            }
                        }
                    }
                    .navigationBarTitle("Search")
                    .navigationSearchBar(
                        searchKey: $searchKey
                    )
                        .onTapGesture {
                            Coordinator.st_searchController.isActive = false
                    }
                }else{
                    // 初始状态
                    Spacer().navigationBarTitle("Search")
                        .navigationSearchBar(
                            searchKey: $searchKey
                    )
                }
            }
        }

    }
    func loadMore() {
          if self.page < 4 {
              self.page += 1
              print("Load more..." + "\(page)")
          }
      }
}

