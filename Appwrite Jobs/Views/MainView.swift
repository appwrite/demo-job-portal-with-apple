//
//  MainView.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 06/10/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        Group {
            if authVM.isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
        .animation(.easeInOut)
        .transition(.move(edge: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
