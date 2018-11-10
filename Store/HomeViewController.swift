//
//  HomeViewController.swift
//  Store
//
//  Created by liroy yarimi on 10/11/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class HomeViewController:  UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let navigationBarTitle = ["Home","Trending","Subscriptions","Account"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        setupMenuBar()
//        setupNavigationBar()
    }
    
    //MARK:- navigation bar bottom
    
//    private func setupNavigationBar(){
//        navigationItem.title = "Home View"
//        navigationItem.leftBarButtonItems = [moreButton, searchBarButtonItem]//rightBarButtonItems with 's' in the end!!
//
//    }
//    //search button and three points button
//    func setupNavBarButtons(){
//
//        //search bar button
//        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)//make the search bar white
//        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
//
//        //more bar button (3 points)
//        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
//
//        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]//rightBarButtonItems with 's' in the end!!
//    }
    
    
    
    //MARK:- create maue bar
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeViewController = self
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    private func setupMenuBar(){
        
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = menuBar.menuBarBackgroundColor
        view.addSubview(backgroundView)
        //get the safe area guide height
        let window = UIApplication.shared.keyWindow
//        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom//get the bottom safe area height
        guard let bottomSafeAraeHaight = bottomPadding else { return}
        print(bottomSafeAraeHaight)
        
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 50+bottomSafeAraeHaight)
            ])
        
        view.addSubview(menuBar)
        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            menuBar.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

}

