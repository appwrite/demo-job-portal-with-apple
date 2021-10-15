//
//  HomeView.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 06/10/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @ObservedObject var jobsVM: JobsViewModel = JobsViewModel()
    
    var body: some View {
        NavigationView {
            AppwriteLogo {
                VStack {
                    HStack {
                        Text("FlAppwrite Jobs")
                            .font(.custom("Poppins", size: 16))
                            .fontWeight(.bold)
                        Spacer()
                        Text("Logout")
                            .font(.custom("Poppins", size: 16))
                            .onTapGesture {
                                authVM.logout()
                            }
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 36)
                    
                    ScrollView {
                        HStack {
                            Text("Find your dream\nFlutter job")
                                .largeSemiBoldFont()
                            Spacer()
                        }
                        .padding(.vertical, 30)
                        .padding(.horizontal, 36)
                        
                        ForEach(jobsVM.jobs) { job in
                            JobItemView(job)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 36)
                        }
                    }
                }
                .navigationBarHidden(true)
            }
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
