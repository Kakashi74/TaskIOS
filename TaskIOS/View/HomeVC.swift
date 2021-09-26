//
//  HomeVC.swift
//  TaskIOS
//
//  Created by Ahmed on 9/23/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var emptyView : UIView!
    @IBOutlet weak var HomeColView : UICollectionView!{
        didSet {
            HomeColView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        }
    }
    
    var presenter: HomePresenter = HomePresenter()
    var products = [Products](){
        didSet{
            HomeColView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        products =  DataBaseManegar.sharedDB.fetchFavRecipes()
        if products.count == 0 {
            HomeColView.isHidden = true
            emptyView.isHidden = false
        } else {
            HomeColView.isHidden = false
            emptyView.isHidden = true
        }
    }
    
    @IBAction func addProductBtn(_ sender: UIButton){
        poshWithoutData(identifire: "AddProductVC")
    }
    
}


extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        // let item = presenter.getProductsAt(index: indexPath.item)
        cell.configureCell(model: products[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsVC
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.Details = products[indexPath.item]
        self.present(vc,animated: true, completion: nil)
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
