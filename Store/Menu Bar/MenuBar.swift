//
//  MenuBar.swift
//  Store
//
//  Created by liroy yarimi on 10/11/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class MenuBar: BaseCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let menuBarBackgroundColor = UIColor.rgb(red: 250, green: 250, blue: 250)//UIColor.rgb(red: 230, green: 32, blue: 31)
    private lazy var seletedMenuBarItem = imageNames.count - 1
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = menuBarBackgroundColor
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let cellId = "cellId"
    private let imageNames = ["more_icon","location-pin","profile icon","search_icon","home"]
    private let labelTitle = ["more","location","profile","search","ראשי"]
    var homeViewController: HomeViewController?
    
    //MARK: - setupViews - Main function that call from init (BaseCell)
    
    override func setupViews() {
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor)
            ])
        
        //selected the home button in default
        let selectedIndexPath = NSIndexPath(item: seletedMenuBarItem, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .top)
        
    }
    
    //MARK: - Functions
    
    //move the rectangle white menu, under the user choice
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        
//        //make animate
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.layoutIfNeeded()
//        }, completion: nil)
        
    }
    
    //numberOfSections - number of button in the menu bar
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    //sizeForItemAt - button size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/(CGFloat(imageNames.count)), height: frame.height)
    }
    
    //minimumInteritemSpacingForSectionAt - delete spaces between cells (buttons)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //cellForItemAt - create button
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)//make the icon dark
        
        cell.nameLabel.text = labelTitle[indexPath.item]
        
        return cell
    }
    
    
    
}
