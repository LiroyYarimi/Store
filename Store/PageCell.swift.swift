//
//  PageCell.swift
//  Store
//
//  Created by liroy yarimi on 17/11/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class PageCell: BaseCell {
    
    let mainPink = UIColor.rgb(red: 232, green: 68, blue: 133)
    let lightPink = UIColor.rgb(red: 249, green: 207, blue: 224)//pink gray color

    var numberOfPage: Int?{
        didSet{
            if let pages = numberOfPage{
                pageControl.numberOfPages = pages
            }
            
        }
    }
    
    let imageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = mainPink
        pc.pageIndicatorTintColor = lightPink
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    override func setupViews(){
        
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
            ])
    
        
    }

    
}



