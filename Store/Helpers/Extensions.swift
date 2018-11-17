//
//  Extensions.swift
//  Store
//
//  Created by liroy yarimi on 10/11/2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit


extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

/*
extension UIView{
    func addConstraintsWithVisualFormat(format: String, views: UIView...){
        
        var viewDictionary = [String: UIView]()
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}
*/
