//
//  PopularsAndSpecialsRowView.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 05/12/2023.
//

import SwiftUI

struct PopularsAndSpecialsRowView: View {
    // MARK: - PROPERTIES

    var populars: Popular
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(url: URL(string: populars.image)) { image in
                image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 160, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                    .cornerRadius(8)
                    .padding(12)

            } placeholder: {
                Image(systemName: "bag")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 140, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                    .cornerRadius(8)
                    .padding(12)

            }
                        
            VStack(alignment: .center, spacing: 12) {
                Text(populars.name)
                    .font(.title2)
                    .fontWeight(.bold)

                Text(populars.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(4)

                Text("$ \(populars.calories)")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.green)

            }
            .padding(12)
        }
        .padding(.horizontal, 12)  // Add padding around the card
        .frame(width: 200, height: 340)  // Increase height for a more comfortable size
        .background(Color("CardBackground"))  // Set a background color
        .cornerRadius(12)  // Add corner radius for rounded corners
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)  // Add a subtle shadow
    }
}

// MARK: - PREVIEW

#Preview {
    PopularsAndSpecialsRowView(populars: Popular(id: "1", name: "Hello", description: "this is a  description description description description description description description descriptiondescription", image: "", calories: 12))
}
