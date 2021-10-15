//
//  JobItemView.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 07/10/2021.
//

import SwiftUI
import Kingfisher

struct JobItemView: View {
    let job: Job
    
    init(_ job: Job) {
        self.job = job
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(hex: "1E1C24"))
                            
            VStack (alignment: .leading) {
                
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color(hex: "302d39"))
                    
                    KFImage.url(URL(string: job.logo))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                }
                .frame(width: 86, height: 82)
                
                Text(job.title)
                    .largeBoldFont()
                    .padding(.top, 24)
                
                HStack (spacing: 20) {
                    Text(job.company)
                        .normalSemiBoldFont()
                    Text(job.location)
                        .normalSemiBoldFont()
                }
                .padding(.bottom, 24)
                
                Text(job.description)
                    .font(.custom("Poppins", size: 16))
            }
            .padding(.all, 26)
        }
    }
}

struct JobItemView_Previews: PreviewProvider {
    static var previews: some View {
        JobItemView(
            Job(
                id: "1",
                title: "Flutter Developer",
                link: "https://flutter.dev",
                logo: "https://demo.appwrite.io/v1/storage/files/61667e8e6cb16/preview?project=615d75f94461f",
                company: "Google",
                description: "Flutter Devemoper",
                location: "Mountain View, CA"
            )
        )
        .preferredColorScheme(.dark)
    }
}
