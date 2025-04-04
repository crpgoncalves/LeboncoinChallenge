//
//  ADItemView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//
import SwiftUI

struct ADItemView: View {
    @Environment(\.colorScheme) var colorScheme
    let ad: ADModel
    
    var body: some View {
        let theme = AppTheme.current(for: colorScheme)
        
        VStack(alignment: .leading, spacing: 12) {
            if let imageUrl = ad.imagesURL.thumb,
                let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 220)
                        .cornerRadius(20)
                        .clipped()
                        .shadow(radius: 10)
                } placeholder: {
                    theme.secondaryColor.opacity(0.3)
                        .frame(height: 220)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                }
            }
            
            Text(Localized.string(ad.category?.name))
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(theme.secondaryColor)
                .padding(.top, 10)
            
            Text(ad.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(theme.textColor)
                .lineLimit(2)
                .truncationMode(.tail)
            
            HStack {
                Text(PriceFormatter.formatPrice(ad.price))
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.green)
                    .padding(.top, 5)
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
        .background(theme.backgroundColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(theme.secondaryColor, lineWidth: 2)
        )
        .shadow(radius: 12)
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
