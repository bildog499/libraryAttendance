//
//  deletePeriod.swift
//  tracker app
//
//  Created by Shane acheson on 1/13/23.
//

import Foundation
import SwiftUI
import Firebase
struct deletePeriod: View {
    let db = Firestore.firestore()
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        Form{
            Button{
                delete(collection: db.collection("1"))
            } label: {
                Text("Period 1")
            }
            Button{
                delete(collection: db.collection("2"))
            } label: {
                Text("Period 2")
            }
            Button{
                delete(collection: db.collection("3"))
            } label: {
                Text("Period 3")
            }
            Button{
                delete(collection: db.collection("4"))
            } label: {
                Text("Period 4")
            }
            Button{
                delete(collection: db.collection("5"))
            } label: {
                Text("Period 5")
            }
            Button{
                delete(collection: db.collection("6"))
            } label: {
                Text("Period 6")
            }
            Button{
                delete(collection: db.collection("7"))
            } label: {
                Text("Period 7")
            }
            Button{
                delete(collection: db.collection("8"))
            } label: {
                Text("Period 8")
            }
            Button{
                delete(collection: db.collection("9"))
            } label: {
                Text("Period 9")
            }
            Button{
                viewModel.adminPage()
            } label: {
                Text("Back")
            }
        }
    }
    func delete(collection: CollectionReference) {
        collection.limit(to: 50).getDocuments { (docset, error) in
            let docset = docset
            let batch = collection.firestore.batch()
            docset?.documents.forEach {
                batch.deleteDocument($0.reference)
            }
            batch.commit {_ in
                self.delete(collection: collection)
            }
        }
    }
}
        


struct deletePeriod_Previews: PreviewProvider {
    static var previews: some View {
        deletePeriod()
    }
}
