//
//  HomeViewController.swift
//  DYZB
//
//  Created by TonyYang on 2017/6/16.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏
        setupNavigationBar()
    
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
