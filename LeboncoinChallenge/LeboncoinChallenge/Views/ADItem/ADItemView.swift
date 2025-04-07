//
//  ADItemView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import SwiftUI

struct ADItemView: View {
    let ad: ADItemViewModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let urlString = ad.image,
               let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty, .failure:
                        Color.gray.opacity(0.3)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.black.opacity(0.3), .black.opacity(0.9)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                            )
                            .clipped()
                    @unknown default:
                        EmptyView()
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(ad.categoryName)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(ad.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)

                HStack {
                    Text(ad.price)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.green)

                    Spacer()

                    if ad.isUrgent {
                        Text("list_screen.urgent")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Capsule().fill(Color.red))
                            .transition(.scale)
                    }
                }
            }
            .padding()
        }
        .frame(minHeight: 250)
        .background(Color.black.opacity(0.05))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}



struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ADItemView(ad: ADItemViewModel(ad:
                                        ADModel(id: 1,
                                                categoryId: 2,
                                                title: "Amazing Product",
                                                description: "This is an amazing product",
                                                price: 99.99,
                                                imagesURL: ImagesURL(small: nil,
                                                                     thumb: nil),
                                                creationDate: "2025-04-03",
                                                isUrgent: true)))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
