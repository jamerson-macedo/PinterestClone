//
//  MainTabViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 10/03/25.
//

import Foundation
import Observation
import UIKit
@Observable
class MainTabViewModel {
    var selectedTab : Int = 0
    var showCreateMenu : Bool = false
    init() {
        configureTabbarApperance()
    }
    private func configureTabbarApperance() {
        UIView.appearance(whenContainedInInstancesOf: [UITabBarController.self]).tintColor = .black
    }
}
