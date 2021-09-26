//
//  HomePresenter.swift
//  TaskIOS
//
//  Created by Ahmed on 9/23/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation

class HomePresenter {
    
    weak var view: HomeVC?
    
    func attachView(view:HomeVC){
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    var products : [ProductModel] = [
      //  HomeModel(image: "image1", title: "Nike Air Force 1", description: "Lorem ipsum dolor sit amet consectur", price: 30) ,
      //  HomeModel(image: "image2", title: "Nike Air Max", description: "Lorem ipsum dolor sit amet consectur", price: 30) ,
      //  HomeModel(image: "image3", title: "Nike Sportswear", description: "Lorem ipsum dolor sit amet consectur", price: 30) ,
      //  HomeModel(image: "image4", title: "Nike KD13", description: "Lorem ipsum dolor sit amet consectur", price: 30)
    ]
    
    
    func getProductsCount () -> Int {
        return products.count
    }
    
    func getProductsAt(index: Int)-> ProductModel {
        return products[index]
    }
    
}
