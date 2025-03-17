//
//  SettingOption.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import Foundation
enum SupportOption : Int, CaseIterable, Identifiable{
    case helpCenter
    case termsOfService
    case privacyPolicy
  case about
    

    
    var id : Int{
        return self.rawValue
    }
    var title : String{
        switch self {
            
        case .helpCenter:
            "Help Center"
        case .termsOfService:
            "Terms of Service"
        case .privacyPolicy:
            "Privacy Policy"
        case .about:
            "About"
        }
    }
}
