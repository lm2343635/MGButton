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
    static var cornerRaduis = "MGButton.cornerRaduis"
}

extension UIButton {
    
    @IBInspectable public var cornerRaduis: CGFloat {
        get {
            guard let cornerRaduis = objc_getAssociatedObject(self, &AssociatedKeys.cornerRaduis) as? CGFloat else {
                return 0
            }
            return cornerRaduis
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.cornerRaduis, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            self.layer.cornerRadius = newValue
        }
    }
    
}