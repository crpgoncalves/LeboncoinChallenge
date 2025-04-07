//
//  ADItemView.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//
import SwiftUI

struct ADItemView: View {
    @Environment(\.colorScheme) var colorScheme
    let ad: ADItemViewModel
    
    var body: some View {
        let theme = AppTheme.current(for: colorScheme)
        
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            if let urlString = ad.image,
               let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        theme.secondaryTextColor.opacity(0.3)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .shadow(radius: 10)
                        
                        
                    case .failure(_):
                        VStack(spacing: 10) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.red)
                                .font(.largeTitle)
                            Text("cached.async.download_failed")
                                .font(.subheadline)
                                .foregroundColor(theme.textColor)
                        }
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 220)
                .cornerRadius(20)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Text(ad.categoryName)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(theme.secondaryTextColor)
                .padding(.top, 10)
            
            Text(ad.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(theme.textColor)
                .lineLimit(2)
                .truncationMode(.tail)
            
            HStack {
                Text(ad.price)
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
            Spacer()
        }
        .padding()
        .background(theme.backgroundColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
        )
        .shadow(radius: 12)
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
