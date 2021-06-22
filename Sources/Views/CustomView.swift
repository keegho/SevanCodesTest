//
//  File.swift
//  
//
//  Created by Kegham Karsian on 20/06/2021.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateFrames()
        }
    }
    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//           didSet {
//               updateFrames()
//           }
//       }
    
//    @IBInspectable var cornerRadiusRatio: CGFloat = 1.0 {
//        didSet {
//            updateFrames()
//        }
//    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            updateFrames()
        }
    }
    
    override var frame: CGRect {
        didSet {
            updateFrames()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateFrames()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    func updateFrames() {
        if rounded {
           layer.cornerRadius = frame.size.height/2.0
       } else {
            self.magicallySetCornerRadius()
            //layer.cornerRadius = frame.height/cornerRadius * cornerRadiusRatio // for specific corner ratio
       }
               

      // layer.borderWidth = borderWidth
      // layer.borderColor = borderColor.cgColor
       layer.shadowColor = shadowColor.cgColor
       layer.shadowRadius = shadowRadius
       layer.shadowOffset = shadowOffset
       layer.shadowOpacity = 1
    }
    
}
