//
//  ContentView.swift
//  StoreApp
//
//  Created by M.Ömer Ünver on 28.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var storeListViewModel = StoreViewListModel()
    @State var categoryEndPoint : EndPoint = .all
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationStack{
            ScrollView(.vertical,showsIndicators: false) {
                Picker("", selection: $categoryEndPoint) {
                    ForEach(EndPoint.allCases, id: \.self) { endPoint in
                        Text(endPoint.rawValue)
                    }
                    .onChange(of: categoryEndPoint) { value in
                        DispatchQueue.main.async {
                            storeListViewModel.getProducts(endPoint: value)
                        }
                    }
                }
                .pickerStyle(.palette)
                .padding()
                .colorMultiply(.white).colorInvert()
                .colorMultiply(.orange).colorInvert()
                
                LazyVGrid(columns: columns, content: {
                    ForEach(storeListViewModel.storeProduct, id: \.id) { product in
                        ProductView(products: product.product)
                    }
                })
                
                
                
                
                
                
            }
        }
        .onAppear(){
            DispatchQueue.main.async {
                storeListViewModel.getProducts(endPoint: categoryEndPoint)
            }
        }
    }
}

#Preview {
    ContentView()
}
