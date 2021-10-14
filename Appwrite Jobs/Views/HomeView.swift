//
//  HomeView.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 06/10/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authVM: AuthViewModel
    let jobsVM: JobsViewModel = JobsViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                ForEach(jobsVM.jobs) { job in
                    JobItemView()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Appwrite Jobs")
            .navigationBarItems(trailing: actions)
        }
    }
    
    var actions: some View {
        HStack {
            Button("Logout") {
                authVM.logout()
            }
            .foregroundColor(.white)
            Button("Profile") {
                
            }
            .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
