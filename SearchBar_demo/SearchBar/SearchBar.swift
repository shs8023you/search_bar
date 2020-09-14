//
//  SearchBar.swift
//  SearchBar_demo
//
//  Created by Leo on 2020/9/14.
//  Copyright © 2020 Leo. All rights reserved.
//


import SwiftUI

struct NavigationSearchBarHosting: UIViewControllerRepresentable {
    
    @Binding var searchKey: String?
    
    
    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.parent?.navigationItem.searchController = context.coordinator.searchController
        uiViewController.parent?.navigationItem.hidesSearchBarWhenScrolling = false
        context.coordinator.searchController.searchBar.text = searchKey
        context.coordinator.searchController.searchBar.placeholder = "Tab here to search"
        //        context.coordinator.searchController.searchBar.showsCancelButton = false
        context.coordinator.searchController.searchBar.showsCancelButton = false
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, UISearchBarDelegate, UISearchResultsUpdating {
    
    var parent: NavigationSearchBarHosting
    static var st_searchController: UISearchController = UISearchController()
    var searchController: UISearchController
    init(_ navigationSearchBarHosting: NavigationSearchBarHosting) {
        self.parent = navigationSearchBarHosting
        self.searchController = Coordinator.st_searchController
        super.init()
        setupSearchController()
    }
    
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.setImage(UIImage(named: "close_gray"), for: .clear, state: .normal)
        //            print("setupSearchController")
        
    }
    
    
    // UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        print("updateSearchResults \(searchController.searchBar.text)")
        
        DispatchQueue.main.async {
            self.parent.searchKey = searchController.searchBar.text
        }
        
        
    }
    
  
    
    //UISearchDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchController.searchBar.setImage(UIImage(), for: .search, state: .normal)
        print("searchBarShouldBeginEditing")
        
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textDidChange \(searchText.count)")
        
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing \(searchController.searchBar.text)")
        self.parent.searchKey =  searchController.searchBar.text

        
    }
}

struct NavigationSearchBarModifier: ViewModifier {
    
    @Binding var searchKey: String?
    
    
    func body(content: Content) -> some View {
        content.background(
            NavigationSearchBarHosting(
                searchKey: $searchKey
            )
        )
//            .onTapGesture {
//            self.searchKey = ""
//            Coordinator.st_searchController.isActive = false
//
//        }
//
    }
}

public extension View {
    
    func navigationSearchBar(
        searchKey: Binding<String?>
        
    ) -> some View {
        self.modifier(
            NavigationSearchBarModifier(
                searchKey: searchKey
                
            )
        )
    }
    
    
}
