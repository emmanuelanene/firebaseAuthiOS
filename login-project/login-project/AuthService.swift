//
//  AuthService.swift
//  login-project
//
//  Created by Emmanuel Anene on 20/10/2024.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    public static let shared = AuthService()
    private init() {}
    
    public func registerUser(
        with registerUser: RegisterUserRequest,
        completion: @escaping (Bool, Error?) -> Void
    ) {
        let username = registerUser.username
        let email = registerUser.email
        let password = registerUser.password
        
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
                
            if let error = error{
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email
                ]) {
                    error in
                    
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
        }
    }
    
    
    
    public func signIn(
        with userRequest: LoginUserRequest,
        completion: @escaping (Bool, Error?) -> Void
    ) {
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            
            if let error = error {
                completion(false, error)
                return
            }
            
            else {
                completion(true, nil)
            }
        }
    }
    
    
    
    
    
    
    
    
    public func signOut (
        completion: @escaping (Error?) -> Void
    ) {
        do{
            try Auth.auth().signOut()
            completion(nil)
        }
        catch let error {
            completion(error)
        }
        
    }
    
    
    
    
    
    
    
    
    
    public func forgotPassowrd(
        with email: String,
        completion: @escaping (Error?) -> Void
    ) {
        Auth.auth().sendPasswordReset(withEmail: email) {
            error in
            
            if let error = error {
                completion(error)
            }
            
            completion(nil)
        }
    }
    
}
