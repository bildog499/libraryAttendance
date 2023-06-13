//
//  ContentView.swift
//  tracker app
//
//  Created by Shane Acheson on 9/9/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        VStack{
            Image("tap")
                .position(x: 200, y: 100)
            Image("bookcase")
                .position(x:200, y:200)
            Button {
                viewModel.mainView()
            } label: {
                Text("Sign up")
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0.8, green: 0.085, blue: 0.132))
                    .cornerRadius(15)
                    .padding()
            }
            Button{
                viewModel.adminlogin()
            } label: {
                Text("Admin login")
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0.8, green: 0.085, blue: 0.132))
                    .cornerRadius(15)
                    .padding()
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
