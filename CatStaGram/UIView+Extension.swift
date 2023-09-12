//
//  UIView+Extension.swift
//  CatStaGram
//
//  Created by lyanju on 2023/09/12.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
