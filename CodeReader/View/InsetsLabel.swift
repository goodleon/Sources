//
//  InsetsLabel.swift
//  CodeReader
//
//  Created by vulgur on 2016/10/20.
//  Copyright © 2016年 MAD. All rights reserved.
//

import UIKit

@IBDesignable class InsetsLabel: UILabel {
    @IBInspectable var topInsets: CGFloat = 0.0
    @IBInspectable var bottomInsets: CGFloat = 0.0
    @IBInspectable var leftInsets: CGFloat = 5.0
    @IBInspectable var rightInsets: CGFloat = 5.0
    
    var insets: UIEdgeInsets {
        get {
            return UIEdgeInsetsMake(topInsets, leftInsets, bottomInsets, rightInsets)
        }
        set {
            topInsets = newValue.top
            bottomInsets = newValue.bottom
            leftInsets = newValue.left
            rightInsets = newValue.right
        }
    }
    
    override func drawText(in rect: CGRect) {
        let insects = UIEdgeInsets.init(top:topInsets, left: leftInsets, bottom: bottomInsets, right: rightInsets)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insects))
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.width += leftInsets + rightInsets
        newSize.height += topInsets + bottomInsets
        return newSize
    }
    
    override var intrinsicContentSize : CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += leftInsets + rightInsets
        contentSize.height += topInsets + bottomInsets
        return contentSize
    }
}
