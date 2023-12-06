//
//  SpeacialsRowView.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 05/12/2023.
//

import SwiftUI

struct SpeacialsRowView: View {
    // MARK: - PROPERTIES

    var populars: Popular
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: populars.image)) { image in
                image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                    .cornerRadius(8)

            } placeholder: {
                Image(systemName: "bag")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                    .cornerRadius(8)

            }
                        
            VStack(alignment: .leading, spacing: 2) {
                Text(populars.name)
                    .font(.title2)
                    .fontWeight(.bold)

                Text(populars.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                Text("$ \(populars.calories)")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.green)

            }
        }
        .padding(.horizontal, 12)  // Add padding around the card
        .frame(width: 300, height: 100)  // Increase height for a more comfortable size
        .background(Color("CardBackground"))  // Set a background color
        .cornerRadius(12)  // Add corner radius for rounded corners
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)  // Add a subtle shadow
    }
}

// MARK: - PREVIEW

#Preview {
    SpeacialsRowView(populars: Popular(id: "1", name: "Hello", description: "this is a descriptiondescriptiondescript descriptiondescriptiondescript descriptiondescriptiondescript", image: "", calories: 12))
}
