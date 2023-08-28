//
//  WebService.swift
//  StoreApp
//
//  Created by M.Ömer Ünver on 28.08.2023.
//

import Foundation

class WebService {
    private let baseUrl = "https://fakestoreapi.com/products"
    
    func getData(from endPoint : EndPoint, completion : @escaping(Result<[StoreModel]? , DownloaderError>) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)\(endPoint.description)") else {
            return completion(.failure(.yanlisUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let products = try? JSONDecoder().decode([StoreModel].self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(products))
            
            
            
        }
        .resume()
        
        
    }
    
    
}
enum EndPoint : String, CaseIterable {
    case all = "All"
    case jewellery = "jewelery"
    case electronics = "electronic"
    case men = "men"
    case women = "women"
    
    var description : String {
        switch self {
        case .all : return "/"
        case .electronics : return "/category/electronics"
        case .jewellery : return "/category/jewelery"
        case .men : return "/category/men's%20clothing"
        case .women : return "category/women's%20clothing"
        }
    }
    
    
}
enum DownloaderError : Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
    
}
