//
//  IndicatorView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 25/03/25.
//

import SwiftUI

struct IndicatorView: View {
    var numberOfScreens : Int
    var body: some View {
        HStack{
            ForEach(0..<numberOfScreens,id:\.self){_ in
                Circle().fill(Color(.darkGray))
                    .frame(width: 8,height: 8)
            }
           
            Circle().stroke(Color(.darkGray),lineWidth: 3)
                .frame(width: 7,height: 7)
            ForEach(0..<(6 - numberOfScreens),id:\.self){_ in
                
                Circle().fill(Color(.gray))
                    .frame(width: 8,height: 8)
            }
        }
    }
}
