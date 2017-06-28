//
//  HomeViewController.swift
//  DYZB
//
//  Created by TonyYang on 2017/6/16.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

import UIKit

private let KTitleViewH: CGFloat = 40
class HomeViewController: UIViewController {
    
    // MARK: - 懒加载属性
    fileprivate lazy var pageContentView : PageContentView = { [weak self] in
        // 1.确定内容的frame
        let contentH = KScreenH - KStatussBarH - KNavigationBarH - KTitleViewH - KTabbarBarH
        let contentFrame = CGRect(x: 0, y: KStatussBarH + KNavigationBarH + KTitleViewH, width: KScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommentdViewController())
        for _ in 0..<3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self as? PageContentViewDelegate
        return contentView
    }()
    
    fileprivate lazy var pageTitleView : PageTitleView = { [weak self] in
        let titleFrame = CGRect(x: 0, y: KStatussBarH + KNavigationBarH, width: KScreenW, height: KTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    // MARK: 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置UI界面
        setupUI()
    }
    

}


// MARK: 设置UI界面
extension HomeViewController {
    func setupUI() {
        // 不需要自动改变内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1.设置导航栏
        setupNavigationBar()
        
        // 2.添加titleview
        view.addSubview(pageTitleView)
        
        // 3.添加contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.orange
    }
    
    private func setupNavigationBar() {
        // 1.设置左边的Item
        let btn = UIButton()
        btn.setImage(UIImage(named:"logo"), for: .normal)
        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "viewHistoryIcon", hightImageName: "viewHistoryIconHL", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "dym_search_Icon", hightImageName: "search_icon_orange_HL", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "scanIcon", hightImageName: "scanIconHL", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
  
    }
}
// MARK: 遵守PageTitleViewDelegate
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
    

}
// MARK: 遵守PageTitleViewDelegate
extension HomeViewController : PageContentViewDelegate {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTilleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
        
    }
}
