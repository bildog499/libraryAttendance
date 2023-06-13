//
//  mother View.swift
//  tracker app
//
//  Created by Shane acheson on 9/12/22.
//

import SwiftUI

struct MotherView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  
  var body: some View {
    switch viewModel.state {
      case .homepage: ContentView()
      case .secondView: secondView()
      case .thirdView: thirdView()
      case .adminlogin: adminlogin()
      case .adminPage: adminPage()
      case .deletePeriod: deletePeriod()
    }
  }
}

struct MotherView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
