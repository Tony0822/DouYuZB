//
//  PageTitleView.swift
//  DYZB
//
//  Created by TonyYang on 2017/6/18.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView, selectedIndex  index : Int)
}

fileprivate let KScrollLineH: CGFloat = 2

class PageTitleView: UIView {

    // MARK:- 定义属性
    fileprivate var currentIndex: Int = 0
    fileprivate var titles: [String]
    weak var delegate : PageTitleViewDelegate?
    // MARK: - 懒加载属性
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine;
    }()
    
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    
    // MARK: - 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        // 设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK:- 设置UI界面
extension PageTitleView {
    fileprivate func setupUI() {
       
        // 1.添加UIScrolView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2.添加Title对应的Label
        setupTitleLabel()
        
        // 3.设置底线和滚动的红色块
        setupBottomLineAndScrollLine()
    }
    
    fileprivate func setupTitleLabel() {
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - KScrollLineH
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            // 1.创建Label
            let label = UILabel()
           
            // 2.设置Label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.gray
            label.textAlignment = .center
            
            // 3.设置Label的frame
            let labelX: CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
           
            // 4. 将Label添加到ScrollView
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            // 5.给Label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
            
        }
        
        
        
    
    }
    
    fileprivate func setupBottomLineAndScrollLine() {
        // 1. 添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 2.添加scrollLine
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor.orange
        
        // 3.设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - KScrollLineH, width: firstLabel.frame.width, height: KScrollLineH)
        
        
        
    }
}

// MARK: 监听Label的点击
extension PageTitleView {
    @objc fileprivate func titleLabelClick(tapGes : UITapGestureRecognizer) {
        // 1.获取当前Label
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        
        // 2.获取之前的Label
        let oldLabel = titleLabels[currentIndex]
        
        // 3.切换文字颜色
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.darkGray
        
        // 4.保存最新Label的下标值
         currentIndex = currentLabel.tag
     
        // 5.滚动条位置改变
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.2) { 
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        // 6.通知代理
       delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}
