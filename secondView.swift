//
//  secondView.swift
//  tracker app
//
//  Created by Shane acheson on 9/12/22.
//
import Promises
import SwiftUI
import Firebase
struct secondView: View {
    @State public var numStudents: Int = 0
    let periods = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @State public var selectedPeriod: String = ""
    @State public var email: String = ""
    @State public var firstName: String = ""
    @State public var lastName: String = ""
    @EnvironmentObject var viewModel: AuthenticationViewModel
    let db = Firestore.firestore()
    var body: some View {
        VStack{
            Button{
                viewModel.homePage()
            } label: {
                Text("Back")
                    .frame(width: 100, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.init(red: 0.8, green: 0.085, blue: 0.132))
                    .cornerRadius(15)
                    .padding()
            }
            Form{
                Section{
                    TextField("Enter your first name", text: $firstName)
                        .frame(width: 325, height: 20, alignment: .center)
                        .padding()
                        .disableAutocorrection(true)
                    TextField("Enter your last name", text: $lastName)
                        .disableAutocorrection(true)
                        .frame(width: 325, height: 20, alignment: .center)
                        .padding()
                    TextField("Enter your email", text: $email)
                        .frame(width: 325, height: 20, alignment: .center)
                        .padding()
                        .disableAutocorrection(true)
                   
                }
                Section(header: Text("Select a period")) {
                    Picker("periods", selection: $selectedPeriod) {
                        ForEach(periods, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                Section{
                    if (email.contains("stu.socsd.org")){
                        Button {
                            getStudents(compleationHandler:simplecompleationhandler)
                        }label: {
                            if (numStudents<5){
                                Text("Submit")
                                    .foregroundColor(Color.blue)
                            }else{
                                Text("Period is at capacity")
                                    .foregroundColor(Color.red)
                            }
                            
                        }
                    }else{
                        Text("Please enter a valid school email")
                            .foregroundColor(Color.init(red: 0.8, green: 0.085, blue: 0.132))
                    }
                }.disabled(firstName.isEmpty || lastName.isEmpty)
                    
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        
        
    }
    func getStudents(compleationHandler:(Int, String, String, String, String, AuthenticationViewModel)->Void){
        numStudents = 0
        db.collection(selectedPeriod).getDocuments()
        {
            (querySnapshot, err) in

            if let err = err
            {
                print("Error getting documents: \(err)");
            }
            else
            {
                for document in querySnapshot!.documents {
                    numStudents += 1
                }
                simplecompleationhandler(numStudents,selectedPeriod,firstName,lastName,email,viewModel)
            }
        }
    }
    let simplecompleationhandler:(Int, String, String, String, String, AuthenticationViewModel)->Void = {numStudents,selectedPeriod,firstName,lastName,email,viewModel in
        let db = Firestore.firestore()
        if (50 > numStudents){
            db.collection(selectedPeriod).addDocument(data: ["Last Name": lastName, "First Name": firstName, "email": email])
            viewModel.thirdView()
        }
    }
            
        
    
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView()
    }
}
