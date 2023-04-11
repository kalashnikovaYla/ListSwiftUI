//
//  ContentView.swift
//  ListSwiftUI
//
//  Created by sss on 10.04.2023.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let price: String
}


struct ContentView: View {
    
    var products: [Product] = [
            .init(imageName: "image1", title: "Converse", description: "Size 37", price: "200$"),
            .init(imageName: "image2", title: "Reebok", description: "Size 39", price: "250$"),
            .init(imageName: "image3", title: "Adidas", description: "Size 37", price: "330$")
    ]
    
    
    var body: some View {
        
        NavigationView {
            
            List(products, id: \.id) { product in
                
                NavigationLink {
                    ProductItemView(product: product)
                } label: {
                    makeProductCellView(product: product)
                }
                .listRowSeparator(.hidden, edges: .all)
                .swipeActions(edge: .leading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "star")
                            
                    }.tint(.yellow)

                    Button {
                        
                    } label: {
                        Image(systemName: "globe")
                            
                    }.tint(.red)

                }
            }
            .refreshable {
                //pull to refresh
            }
            .navigationTitle("Store")
            .toolbar {
                EditButton()
            }
            
        }
        
    }
    
    func makeProductCellView(product: Product) -> some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(product.title)
                Text(product.description)
                    .foregroundColor(.gray)
                    .font(.caption2)
                    .fontWeight(.light)
                    .padding(.bottom)
                Text(product.price)
                    .font(.caption)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
