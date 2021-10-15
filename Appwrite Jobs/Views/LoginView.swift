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
    @State private var isActiveSignup = false
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        
        NavigationView {
            AppwriteLogo {
                VStack {
                    NavigationLink(destination: SignupView(), isActive: $isActiveSignup) {
                        EmptyView()
                    }
                    HStack {
                        Text("Welcome back to\nFlAppwrite Jobs")
                            .largeSemiBoldFont()
                            .padding(.bottom)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(.top, 60)
                    
                    HStack {
                        Text("Let's sign in.")
                            .largeLightFont()
                        Spacer()
                    }
                    
                    TextField("E-mail", text: self.$email)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(16.0)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(16.0)
                    
                    Button("Login") {
                        authVM.login(email: email, password: password)
                    }
                    .regularFont()
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.pink)
                    .cornerRadius(16.0)
                    
                    HStack {
                        Text("Anonymous Login")
                            .onTapGesture {
                                authVM.loginAnonymous()
                            }
                        Text(".")
                        Text("Signup")
                            .onTapGesture {
                                isActiveSignup = true
                            }
                    }
                    .regularFont()
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .padding([.leading, .trailing], 40)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
