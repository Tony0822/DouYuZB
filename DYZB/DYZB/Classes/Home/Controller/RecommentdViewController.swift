//
//  RecommentdViewController.swift
//  DYZB
//
//  Created by TonyYang on 2017/6/27.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

import UIKit

fileprivate let KItemMargin : CGFloat = 10;
fileprivate let KItemW = (KScreenW - 3 * 10) / 2
fileprivate let KItemH = KItemW * 3 / 4
fileprivate let KHeaderViewH : CGFloat = 50

fileprivate let KNormalCellID = "KNormalCellID"
fileprivate let KHeaderViewID = "KHeaderViewID"

class RecommentdViewController: UIViewController {

    // MARK: 懒加载属性
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
    
        // 1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: KItemW, height: KItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = KItemMargin
        layout.headerReferenceSize = CGSize(width: KScreenW, height: KHeaderViewH);
        layout.sectionInset = UIEdgeInsets(top: 0, left: KItemMargin, bottom: 0, right: KItemMargin)
        
        // 2.创建UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        
//        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: KNormalCellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KHeaderViewID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil)
            , forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KHeaderViewID)
        return collectionView
    }()
    // 系统函数
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置UI界面
        setupUI()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: 设置UI
extension RecommentdViewController {

    fileprivate func setupUI() {
        // 1.将UIcollectionView添加到控制器view
        view.addSubview(collectionView)
    }
}

// MARK:协议
extension RecommentdViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KNormalCellID, for: indexPath)
        cell.backgroundColor = UIColor.yellow
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出section的headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KHeaderViewID, for: indexPath)

        return headerView
    }

}
