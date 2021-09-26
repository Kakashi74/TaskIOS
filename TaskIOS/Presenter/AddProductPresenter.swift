//
//  AddProductPresenter.swift
//  TaskIOS
//
//  Created by Ahmed on 9/26/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation


class AddProductPresenter {
    
    weak var view: AddProductVC?
    
    func attachView(view:AddProductVC){
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    var products : [ProductModel] = []
    
    func saveToCoreData(model: ProductModel){
        DataBaseManegar.sharedDB.SaveToFav(model: model)
    }

}
