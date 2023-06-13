//
//  adminlogin.swift
//  tracker app
//
//  Created by Shane acheson on 1/12/23.
//

import Foundation
import SwiftUI
struct adminlogin: View {
    @State public var passKey: String = ""
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var isSecured: Bool = true
    var body: some View {
        Group {
            if isSecured {
                SecureField("Enter passkey", text: $passKey)
                    .position(x: 300, y: 350)
            } else {
                TextField("Enter passkey", text: $passKey)
                    .position(x: 300, y: 350)
            }
                
        }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .position(x: 350, y:300)
            }
            Button{
                if (passKey == "tappanzeehslibrarymseyer"){
                    viewModel.adminPage()
                }
                else{
                    Text("Invalid Password")
                }
            } label: {
                Text("Enter")
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0.8, green: 0.085, blue: 0.132))
                    .cornerRadius(15)
                    .padding()
                    .foregroundColor(Color.blue)
            }
            Button{
                viewModel.homePage()
            } label: {
                Text("Back")
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0.8, green: 0.085, blue: 0.132))
                    .cornerRadius(15)
                    .padding()
            }
        
    }
}

struct adminlogin_Previews: PreviewProvider {
    static var previews: some View {
        adminlogin()
    }
}
