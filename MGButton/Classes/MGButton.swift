//
//  MGButton.swift
//  MGButton
//
//  Created by Meng Li on 2018/08/20.
//  Copyright (c) 2018 fczm.pw. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

struct AssociatedKeys {
    static var cornerRadius = "MGButton.cornerRadius"
    static var normalBackgroundColor = "MGButton.normalBackgroundColor"
    static var disabledBackgroundColor = "MGButton.disabledBackgroundColor"
    
}

extension UIButton {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            guard let cornerRadius = objc_getAssociatedObject(self, &AssociatedKeys.cornerRadius) as? CGFloat else {
                return 0
            }
            return cornerRadius
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.cornerRadius, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable public var normalBackgroundColor: UIColor? {
        get {
            guard let normalBackgroundColor = objc_getAssociatedObject(self, &AssociatedKeys.normalBackgroundColor) as? UIColor else {
                return nil
            }
            return normalBackgroundColor
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.normalBackgroundColor, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            guard let color = normalBackgroundColor else {
                return
            }
            setBackgroundImage(image(with: color), for: .normal)
        }
    }
    
    @IBInspectable public var disabledBackgroundColor: UIColor? {
        get {
            guard let color = objc_getAssociatedObject(self, &AssociatedKeys.disabledBackgroundColor) as? UIColor else {
                return nil
            }
            return color
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disabledBackgroundColor, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            guard let color = disabledBackgroundColor else {
                return
            }
            setBackgroundImage(image(with: color), for: .disabled)
        }
    }
    
    private func image(with color: UIColor) -> UIImage? {
        let rect = CGRect(origin: .zero, size: bounds.size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        UIGraphicsBeginImageContext(rect.size)
        path.addClip()
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
