//
//  TitleModifier.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(Color(.darkGray))
            .padding(.top)
    }
}
extension View {
    public func titleModifier() -> some View {
        modifier(TitleModifier())
    }
}
