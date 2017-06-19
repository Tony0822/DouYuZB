//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by TonyYang on 2017/6/19.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
