//
//  CustomSecureField.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 20/03/25.
//

import SwiftUI
struct CustomSecureField: View {
    @Binding var isSecureField : Bool
    @Binding var password : String
    var body: some View {
        ZStack(alignment : .trailing){
            if isSecureField{
                SecureField("Password",text: $password).emailmodifier()
            }else {
                TextField("Password",text:$password).emailmodifier()
            }
            Image(systemName: !isSecureField ? "eye.slash.fill" : "eye.fill")
                .padding(.trailing)
                .foregroundStyle(.gray)
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}
