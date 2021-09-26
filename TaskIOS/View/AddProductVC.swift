//
//  AddProductVC.swift
//  TaskIOS
//
//  Created by Ahmed on 9/23/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit

class AddProductVC: UIViewController {

    @IBOutlet weak var ProductName : UITextField!
    @IBOutlet weak var ProductDescription : UITextField!
    @IBOutlet weak var ProductPrice : UITextField!
    
    @IBOutlet var allTextFields : [UITextField]!
    
    var presenter : AddProductPresenter = AddProductPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        view.HideKeyboard()
    }
    
    @IBAction func addProductBtnPressed(_ sender: Any){
        for textField in self.allTextFields where textField.text!.isEmpty {
            textField.shake()
            return
        }
        let title = ProductName.text!
        let desc = ProductDescription.text!
        guard let price = Double(ProductPrice.text!) else { return }
        let allProducts = ProductModel(image: "", title: title, description: desc, price: price)
        presenter.saveToCoreData(model: allProducts)
        
        for emptyText in self.allTextFields {
            emptyText.text = ""
        }
        poshWithoutData(identifire: "HomeVC")
    }

}
