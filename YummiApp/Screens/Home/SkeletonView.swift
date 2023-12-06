//
//  SkeletonView.swift
//  Yummi
//
//  Created by Omar Abdulrahman on 06/12/2023.
//

import SwiftUI

struct SkeletonView: View {
    
    // MARK: - BODY
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.gray.opacity(0.3))
            .frame(height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    .padding(.trailing, 80) // Adjust padding based on your design
            )
    }
}

// MARK: - PREVIEW

#Preview {
    SkeletonView()
}
