//
//  PageTitleView.swift
//  DYZB
//
//  Created by TonyYang on 2017/6/18.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

import UIKit

class PageTitleView: UIView {

    // MARK:- 定义属性
    private var titles: [String]
    
    // MARK: - 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
