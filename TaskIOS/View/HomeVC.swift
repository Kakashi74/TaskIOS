//
//  HomeVC.swift
//  TaskIOS
//
//  Created by Ahmed on 9/23/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var HomeColView : UICollectionView!{
        didSet {
            HomeColView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        }
    }
    
    var presenter: HomePresenter = HomePresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
    }
    
    @IBAction func addProductBtn(_ sender: UIButton){
        poshWithoutData(identifire: "AddProductVC")
    }
    
}


extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getProductsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let item = presenter.getProductsAt(index: indexPath.item)
        
        cell.configureCell(model: item)
        
        return cell
    }
    
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (self.view.frame.width / 3)
        let itemHeight = (self.view.frame.height / 4)
        return CGSize(width: itemWidth + 35, height: itemHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
