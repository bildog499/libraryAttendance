//
//  thirdView.swift
//  tracker app
//
//  Created by Shane acheson on 9/16/22.
//
import SwiftUI
struct thirdView: View{
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View{
        VStack{
            Button {
                viewModel.homePage()
            } label: {
                Text("Return to homepage")
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0.8, green: 0.085, blue: 0.132))
                    .cornerRadius(15)
                    .padding()
            }
            Image("endscreen")
                .position(x: 230, y: 425)
        }
    }
}
struct thirdView_Previews: PreviewProvider {
    static var previews: some View {
        thirdView()
    }
}
