//
//  CategoriesView.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 05/12/2023.
//

import SwiftUI

struct CategoriesView: View {
    
    // MARK: - PROPERTIES

    var category: Category
    
    // MARK: - BODY

    var body: some View {
        HStack(spacing: 12) {
            
            AsyncImage(url: URL(string: category.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)  // Add corner radius for rounded corners

            } placeholder: {
                Image(systemName: "bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
            }

            Text(category.title)
                .font(.caption)
                .fontWeight(.semibold)
                .lineLimit(1)
        }
        .padding(.horizontal, 12)  // Add padding around the card
        .frame(height: 50)  // Increase height for a more comfortable size
        .background(Color("CardBackground"))  // Set a background color
        .cornerRadius(12)  // Add corner radius for rounded corners
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)  // Add a subtle shadow
    }
}

// MARK: - PREVIEW

#Preview {
    CategoriesView(category: Category(id: "1", title: "Meal", image: ""))
}
