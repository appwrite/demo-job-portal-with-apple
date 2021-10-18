//
//  AppwriteService.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 06/10/2021.
//

import Foundation

import Appwrite

class AppwriteService {
    private(set) var client: Client
    private(set) var account: Account
    private(set) var database: Database
    
    static let shared = AppwriteService()
    
    init() {
        client = Client()
            .setEndpoint("https://demo.appwrite.io/v1")
            .setProject("615d75f94461f")
        
        account = Account(client)
        database = Database(client)
    }
    
}
