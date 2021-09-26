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
    
    var products : [HomeModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.HideKeyboard()
        print("new Products\(products)")
    }
    
    @IBAction func addProductBtnPressed(_ sender: Any){
        for textField in self.allTextFields where textField.text!.isEmpty {
            textField.shake()
            return
        }
        let title = ProductName.text!
        let desc = ProductDescription.text!
        guard let price = Double(ProductPrice.text!) else { return }
        let allProducts = HomeModel(image: "", title: title, description: desc, price: price)
        products.append(allProducts)
    }

}
