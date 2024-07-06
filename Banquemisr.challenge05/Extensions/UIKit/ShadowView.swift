//
//  ShadowView.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 3
        layer.masksToBounds = false
        layer.cornerRadius = 8
    }
    
}
