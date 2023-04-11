//
//  ProductItemView.swift
//  ListSwiftUI
//
//  Created by sss on 11.04.2023.
//

import SwiftUI

struct ProductItemView: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Name - " + product.title)
                        .font(.title)
                        .fontWeight(.medium)
                    Text("Price - " + product.price)
                    Text("Description: " + product.description)
                } header: {
                    Image(product.imageName)
                        .resizable()
                        .frame(height: 320)
                        .cornerRadius(10)
                    Spacer()
                }

            }
            
            Button {
                print("Add to card")
            } label: {
                Text("Add to card")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(.pink)
                    .cornerRadius(10)
            }.padding(.bottom)

        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: .init(imageName: "image1", title: "1", description: "description", price: "200$"))
    }
}
