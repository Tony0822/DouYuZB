//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by TonyYang on 2017/6/18.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

import UIKit
extension UIBarButtonItem {
    
    
/* 扩充类函数
    class func createItem(imageName: String, hightImageName: String, size: CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        let point = CGPoint(x: 0, y: 0)
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        btn.frame = CGRect(origin: point, size: size)
        
        return UIBarButtonItem(customView: btn)
        
    }
 */
    // Swift中更希望我们使用，便利构造函数：1.convenience开头， 2.在构造函数中必须明确调用一个设计的构造函数（self）
    convenience init(imageName: String, hightImageName: String = "", size: CGSize) {
        let btn = UIButton()
        let point = CGPoint(x: 0, y: 0)
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        if hightImageName != "" {
            btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        }

        btn.frame = CGRect(origin: point, size: size)
        
        self.init(customView: btn)
    }
}
