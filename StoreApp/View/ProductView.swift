//
//  ProductView.swift
//  StoreApp
//
//  Created by M.Ömer Ünver on 28.08.2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct ProductView: View {
    var products : StoreModel
    var body: some View {
        ZStack(alignment : .topTrailing){
            ZStack(alignment: .bottom, content: {
                WebImage(url: URL(string: products.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                VStack{
                    HStack(alignment: .bottom){
                        VStack(alignment: .leading){
                            Text(products.title)
                                .font(.system(size: 12))
                                .bold()
                            Text("\(products.price, specifier: "%.2f") ₺")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(products.rating.rate, specifier: "%2.f")")
                            .font(.system(size: 10))
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.yellow)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    
                }
                
            })
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            Button {
//                cartManager.addCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

#Preview {
    ProductView(products: StoreModel(id: 1, title: "ürün", price: 12, category: "electronic", description: "Açıklama", image: "", rating: rating(rate: 12, count: 150)))
}
