//
//  ShadowedButton.swift
//  O3
//
//  Created by Andrei Terentiev on 9/16/17.
//  Copyright © 2017 drei. All rights reserved.
//

import Foundation

import UIKit

class ShadowedButton: UIButton {

    var shadowLayer: CAShapeLayer!

    override var isEnabled: Bool {
        didSet {
            self.theme_backgroundColor = isEnabled == true ?  O3Theme.primaryColorPicker : O3Theme.disabledColorPicker
            if shadowLayer != nil {
                shadowLayer.shadowOpacity = isEnabled == true ? 0.8 : 0
                shadowLayer.fillColor = isEnabled == true ? Theme.light.primaryColor.cgColor : UIColor.clear.cgColor
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.theme_backgroundColor = isEnabled == true ? O3Theme.primaryColorPicker : O3Theme.disabledColorPicker
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 22).cgPath
            shadowLayer.fillColor = isEnabled == true ? Theme.light.primaryColor.cgColor : UIColor.clear.cgColor
            shadowLayer.shadowColor = Theme.light.disabledColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity =  isEnabled == true ? 0.8 : 0
            shadowLayer.shadowRadius = 2

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        shadowLayer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        shadowLayer.shadowOpacity = 0.8
        super.touchesBegan(touches, with: event)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.8
        super.touchesEnded(touches, with: event)
    }
}
