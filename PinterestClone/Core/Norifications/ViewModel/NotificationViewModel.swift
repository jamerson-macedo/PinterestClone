//
//  NotificationViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import Foundation
import Observation

enum NotificationTabSelection{
    case Updates
    case Inbox
}

@Observable
class NotificationViewModel {
    var tabSelection: NotificationTabSelection = .Updates
}

