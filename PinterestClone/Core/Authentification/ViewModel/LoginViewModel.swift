//
//  LoginViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import Foundation
import Observation

@Observable
class LoginViewModel {
    var email: String = ""
    var showSignInView : Bool = false
    var isSecureField : Bool = true
    var password: String = ""
    var showAddPasswordView : Bool = false
    var fullName: String = ""
    var birthDate: String = ""
    var gender : String = ""
    var isPresented: Bool = true
    var selectedDate : Date = Date()
    var tempDate : Date = Date()
    let calendar = Calendar.current
    let months = Calendar.current.shortMonthSymbols
    var avalialbleYears : [Int] {
        Array((1900...2025).reversed())
    }
    var showCountriesList : Bool = false
    var country : String = "Brasil"
    var isNavigationActive : Bool = false
    func checIfEmailexists() async throws ->Bool {
        return false
    }
    func dayComponents(day : Int) -> Date {
        calendar.date(from: DateComponents(
            year: calendar.component(.year, from: tempDate),
            month: calendar.component(.month, from: tempDate),
            day: day
            
        )) ?? Date()
    }
    func dayComponents(month : Int) -> Date {
        calendar.date(from: DateComponents(
            year: calendar.component(.year, from: tempDate),
            month: month,
            day: calendar.component(.day, from: tempDate)
            
        )) ?? Date()
    }
    func dayComponents(year : Int) -> Date {
        calendar.date(from: DateComponents(
            year: year,
            month: calendar.component(.month, from: tempDate),
            day: calendar.component(.day, from: tempDate)
        )) ?? Date()
    }
}
