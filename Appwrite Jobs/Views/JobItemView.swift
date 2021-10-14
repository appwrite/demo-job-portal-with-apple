//
//  JobItemView.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 07/10/2021.
//

import SwiftUI

struct JobItemView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(hex: "1E1C24"))
                .shadow(color: .gray, radius: 5.0, x: 0.2, y: -0.5)
                            
            VStack (alignment: .leading, spacing: 10) {
                Text("Flutter Developer")
                    .font(.largeTitle)
                
                HStack (spacing: 20) {
                    Text("Google")
                    Text("Mountain View, CA")
                }
                
                Text("Full time Flutter developer for a reputed company.")
                    .font(.subheadline)
            }
            .padding(.all, 16)
        }
    }
}

struct JobItemView_Previews: PreviewProvider {
    static var previews: some View {
        JobItemView()
            .preferredColorScheme(.dark)
    }
}
