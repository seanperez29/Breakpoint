//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.black.cgColor
    }
}
