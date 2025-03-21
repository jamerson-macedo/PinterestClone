//
//  EmailModifier.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 20/03/25.
//

import SwiftUI

struct EmailModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding(12)
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray3),lineWidth: 1)
            }
    }
    
    
}
extension View {
    func emailmodifier() -> some View {
        modifier(EmailModifier())
    }
}

