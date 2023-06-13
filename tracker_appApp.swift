//
//  tracker_appApp.swift
//  tracker app
//
//  Created by Shane acheson on 9/9/22.
//

import SwiftUI
import Firebase
@main
struct tracker_appApp: App {
    init() {
    FirebaseApp.configure()
    }
    @StateObject var viewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(viewModel)
        }
    }
}
