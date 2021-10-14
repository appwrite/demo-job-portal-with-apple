//
//  JobsViewModel.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 14/10/2021.
//

import Foundation

class JobsViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    
    init() {
        getJobs()
    }
    
    func getJobs() {
        AppwriteService.shared.database.listDocuments(collectionId: "615ec687829fa") {
            result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let err):
                    print(err.message)
                case .success(let docList):
                    let convert: ([String: Any]) -> Job = { dict in
                        return Job.from(map: dict)
                    }
                    self.jobs = docList.convertTo(fromJson: convert)
                }
            }
        }
    }
}
