//
//  ItemView.swift
//  SearchBar_demo
//
//  Created by Leo on 2020/9/14.
//  Copyright © 2020 Leo. All rights reserved.
//


import SwiftUI



struct ItemView: View {
    var item:itemModel
    
    let buttonAction: () -> Void
    
    var body: some View {
        HStack(alignment:.center){
            VStack(alignment:.leading){
                Text("\(item.title)")
                    .fontWeight(.heavy)
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.leading,5)
                    .padding(.trailing,5)
                
                Text("\(item.subTitle)")
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.leading,5)
                    .padding(.trailing,5)
                
            }
            Spacer()
            Text("$\(String(format:"%.2f",item.price))")
                .padding(.top,5)
                .padding(.bottom,5)
                .padding(.leading,15)
                .padding(.trailing,15)
                .foregroundColor(
                    Color.init(item.hightCount ? UIColor.init(red: 101/255, green: 139/255, blue: 244/255, alpha: 1):.lightGray))
                .background(Color.init(item.hightCount ? UIColor.init(red: 101/255, green: 139/255, blue: 244/255, alpha: 0.1):UIColor.init(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)))
                .cornerRadius(10)
            
        }.contentShape(Rectangle())
            .highPriorityGesture(TapGesture().onEnded(buttonAction))
    }
}
