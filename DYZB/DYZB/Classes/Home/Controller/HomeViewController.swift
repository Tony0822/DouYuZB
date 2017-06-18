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
    lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: KStatussBarH + KNavigationBarH, width: KScreenW, height: KTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.backgroundColor = UIColor.red
        
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
        // 1.设置导航栏
        setupNavigationBar()
        // 2.添加titleview
        view.addSubview(pageTitleView)
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
