//
//  StoreViewModel.swift
//  StoreApp
//
//  Created by M.Ömer Ünver on 28.08.2023.
//

import Foundation

class StoreViewListModel : ObservableObject {
    @Published var storeProduct = [StoreViewModel]()
    let webService = WebService()
    
    func getProducts(endPoint: EndPoint){
        webService.getData(from: endPoint) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let product):
                if let product = product {
                    DispatchQueue.main.async {
                        self.storeProduct = product.map(StoreViewModel.init)
                    }
                }
            }
        }
    }

}


struct StoreViewModel {
    var product : StoreModel
    var id : Int {
        product.id
    }
    var title : String {
        product.title
    }
    var price : Double {
        product.price
    }
    var category : String {
        product.category
    }
    var description : String {
        product.description
    }
    var image : String {
        product.image
    }
    var rate : Double {
        product.rating.rate
    }
    var count : Int {
        product.rating.count
    }
    
}
