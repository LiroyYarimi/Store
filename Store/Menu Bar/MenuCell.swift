//
//  MenuCell.swift
//  Store
//
//  Created by liroy yarimi on 10/11/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    private let unselectedColor = UIColor.lightGray//UIColor.rgb(red: 91, green: 14, blue: 13)
    private let selecteedColor = UIColor.rgb(red: 73, green: 151, blue: 227)//UIColor.white
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = unselectedColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = unselectedColor
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = isHighlighted ? selecteedColor : unselectedColor
            nameLabel.textColor = isHighlighted ? selecteedColor : unselectedColor
        }
    }
    
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? selecteedColor : unselectedColor
            nameLabel.textColor = isSelected ? selecteedColor : unselectedColor
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
        
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 28),
            imageView.widthAnchor.constraint(equalToConstant: 28)
            ])

    }
    
}
