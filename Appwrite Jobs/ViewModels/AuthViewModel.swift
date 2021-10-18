//
//  AuthViewModel.swift
//  Appwrite Jobs
//
//  Created by Damodar Lohani on 06/10/2021.
//

import Foundation
import Appwrite

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var error: String?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        getAccount()
    }
    
    private func getAccount() {
        AppwriteService.shared.account.get() { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let err):
                    self.error = err.message
                    self.isLoggedIn = false
                case .success(let user):
                    self.user = user
                    self.isLoggedIn = true
                }
                
            }
        }
    }
    
    func create(name: String, email: String, password: String) {
        AppwriteService.shared.account.create(email: email, password: password, name: name) { result in
            switch result {
            case .failure(let err):
                DispatchQueue.main.async {
                    print(err.message)
                    self.error = err.message
                }
            case .success:
                self.login(email: email, password: password)
            }
        }
    }
    
    func logout() {
        AppwriteService.shared.account.deleteSession(sessionId: "current") { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let err):
                    self.error = err.message
                case .success(_):
                    self.isLoggedIn = false
                    self.error = nil
                }
            }
        }
    }
    
    func loginAnonymous() {
        AppwriteService.shared.account.createAnonymousSession() { result in
            switch result {
            case .failure(let err):
                DispatchQueue.main.async {
                    self.error = err.message
                }
            case .success:
                self.getAccount()
            }
        }
    }
    
    public func login(email: String, password: String) {
        AppwriteService.shared.account.createSession(email: email, password: password) { result in
            switch result {
            case .failure(let err):
                DispatchQueue.main.async {
                    self.error = err.message
                }
            case .success:
                self.getAccount()
            }
        }
    }
    
}
