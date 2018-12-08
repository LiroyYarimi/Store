//
//  PresentationPage.swift
//  Store
//
//  Created by liroy yarimi on 17/11/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class PresentationPage:  BaseCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let imageNames = ["bear_first","heart_second","leaf_third","nedstark"]
    
    //var indexCell = 0
    //var timer = Timer()
//    var pageCell = PageCell(){
//        didSet{
//            //timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
//        }
//    }
    
    // called every time interval from the timer
//    @objc func timerAction() {
//
//        indexCellNext()
//        nextCell()
//
//    }
    
//    func nextCell(){
//        timer.invalidate()
//        pageCell.pageControl.currentPage = indexCell
//        let imageName = imageNames[indexCell]
//        pageCell.imageView.image = UIImage(named: imageName)
//
//        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
//    }
//
//    func indexCellNext(){
//        indexCell += 1
//        if indexCell >= pageCell.pageControl.numberOfPages {
//            indexCell = 0
//        }
//    }
    
    
    // create new collection view inside our cell - collection view for our apps.
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // horizontal scrolling
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let cellId = "cellId"
//    var currentCell :PageCell?
    
    //MARK:- MAIN function - setupViews
    
    override func setupViews(){
        
        
        backgroundColor = UIColor.white
        
        addSubview(collectionView) //inside each cell add app cell
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
//        addSubview(dividerLineView)
//        addSubview(nameLabel)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //PageCell.self
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isPagingEnabled = true
        
        collectionView.showsHorizontalScrollIndicator = false //hide scroll bar
    }
    
    //didSelectItemAt - user did select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("pressentation - didSelectItemAt \(indexPath.item)")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
//        if let cell = currentCell{
//            print("scrollViewWillEndDragging: \(cell.pageControl.currentPage)")
//
//        }
    }
    
    //numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    //cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell

        let indexCell = indexPath.item
        let imageName = imageNames[indexCell]
        cell.imageView.image = UIImage(named: imageName)
        cell.numberOfPage = imageNames.count
        cell.pageControl.currentPage = indexCell
        //pageCell = cell
        
//        currentCell = cell
        
        return cell
        
//        indexCellNext()
//
//        let imageName = imageNames[indexCell]//indexPath.item
//        cell.imageView.image = UIImage(named: imageName)
//        cell.numberOfPage = imageNames.count
//        cell.pageControl.currentPage = indexCell
//        pageCell = cell
        
       // return cell
    }

    
    //minimumLineSpacingForSectionAt - minimun space from each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //size of items (full screen)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    
    
    
}
