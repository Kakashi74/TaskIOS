//
//  ProductDetailsVC.swift
//  TaskIOS
//
//  Created by Ahmed on 9/26/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
   
    var Details : Products?
    var presenter : ProductDetailsPresenter = ProductDetailsPresenter()
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(view: self)
        UpdateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func UpdateUI(){
        titleLabel.text = Details?.productTitle
        descriptionLabel.text = Details?.productDescription
        priceLabel.text = "\(Details?.productPrice ?? 0)"
    }
    
    @IBAction func editProductBtnTapped(_ sender : UIButton){
        
    }
    
    @IBAction func deleteBtnTapped(_ sender : UIButton){
       // presenter.deleteFromCoreData(model: Details)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first
        if touch?.view == self.view {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
}
