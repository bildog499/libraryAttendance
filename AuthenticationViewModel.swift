//
//  AuthenticationViewModel.swift
//  tracker app
//
//  Created by Shane acheson on 9/12/22.
//

import Foundation
import Foundation
class AuthenticationViewModel: ObservableObject {
  enum SignInState {
    case homepage
    case secondView
    case thirdView
    case adminlogin
    case adminPage
    case deletePeriod
  }
  @Published var state: SignInState = .homepage
    func mainView(){
        state = .secondView
    }
    func homePage(){
        state = .homepage
    }
    func thirdView(){
        state = .thirdView
    }
    func adminlogin(){
        state = .adminlogin
    }
    func adminPage(){
        state = .adminPage
    }
    func deletePeriod(){
        state = .deletePeriod
    }
}
