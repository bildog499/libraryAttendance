//
//  adminPage.swift
//  tracker app
//
//  Created by Shane acheson on 1/13/23.
//

import Foundation
import SwiftUI
struct adminPage: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        Form{
            Button{
                viewModel.deletePeriod()
            } label: {
                Text("Clear database")
            }
            Button{
                viewModel.homePage()
            } label: {
                Text("Back")
            }
        }
    }
}

struct adminPage_Previews: PreviewProvider {
    static var previews: some View {
        adminPage()
    }
}
