//
//  LoginView.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 06/10/2021.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        
        VStack {
            Text("Welcome back to\nFlAppwrite Jobs")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            
            Text("Let's sign in.")
                .font(.largeTitle)
                .padding()
            
            TextField("Email", text: self.$email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
            
            SecureField("Password", text: self.$password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
            
            Button("Sign in") {
                authVM.loginAnonymous()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.pink)
            .cornerRadius(20.0)
            
        }
        .foregroundColor(.white)
        .padding([.leading, .trailing], 27.5)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
