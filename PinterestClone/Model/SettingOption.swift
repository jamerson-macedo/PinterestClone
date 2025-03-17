//
//  SettingOption.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import Foundation
enum SettingOption : Int, CaseIterable, Identifiable{
    case accountManagement
    case profileVisibility
    case homeFeedTuner
    case claimedAccounts
    case socialPermissions
    case notifications
    case privacyAndData
    case reportsAndViolationCenter
    
    var id : Int{
        return self.rawValue
    }
    var title : String{
        switch self {
        case .accountManagement:
            return "Account Management"
        case .profileVisibility:
            return "Profile Visibility"
        case .homeFeedTuner:
            return "Home Feed Tuner"
        case .claimedAccounts:
            return "Claimed Accounts"
        case .socialPermissions:
            return "Social Permissions"
        case .notifications:
            return "Notifications"
        case .privacyAndData:
            return "Privacy and Data"
        case .reportsAndViolationCenter:
            return "Reports and Violation Center"
        }
    }
}
