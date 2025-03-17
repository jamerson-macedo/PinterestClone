//
//  SettingOption.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import Foundation
enum LoginOption : Int, CaseIterable, Identifiable{
    case addAccount
    case security
    case logout

    
    var id : Int{
        return self.rawValue
    }
    var title : String{
        switch self {
     
        case .addAccount:
            "Add account"
        case .security:
            "Security"
        case .logout:
            "Log out"
        }
    }
}
