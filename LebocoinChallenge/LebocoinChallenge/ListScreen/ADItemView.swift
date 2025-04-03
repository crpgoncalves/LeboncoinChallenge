//
//  ADItemView.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import SwiftUI


struct ADItemView: View {
    let ad: ADModel

    var body: some View {
        VStack(alignment: .leading) {
            if let imageUrl = ad.imagesURL.thumb,
                let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .clipped()
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(height: 200)
                        .cornerRadius(10)
                }
                .shadow(radius: 10)
            } else {
                Color.gray.opacity(0.3)
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            
            Text("Category: \(ad.categoryId)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(ad.title)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(2)
            
            Text(String(format: "%.2f€", ad.price))
                .font(.title3)
                .foregroundColor(.green)
            
            if ad.isUrgent {
                Text("Urgent")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(5)
                    .background(Capsule().stroke(Color.red, lineWidth: 1))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ADItemView(ad: ADModel(id: 1,
                             categoryId: 2,
                             title: "Amazing Product",
                             description: "This is an amazing product",
                             price: 99.99,
                             imagesURL: ImagesURL(small: nil,
                                                  thumb: "https://example.com/image.jpg"),
                             creationDate: "2025-04-03",
                             isUrgent: true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
