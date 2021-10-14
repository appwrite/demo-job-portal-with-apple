//
//  SignupView.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 11/10/2021.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            
            TextField("Name", text: self.$name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
            
            TextField("Email", text: self.$email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
            
            SecureField("Password", text: self.$password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
            
            Button("create account") {
                authVM.create(name: name, email: email, password: password)
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.pink)
            .cornerRadius(20.0)
                
        }
        .padding([.leading, .trailing], 27.5)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .preferredColorScheme(.dark)
    }
}
