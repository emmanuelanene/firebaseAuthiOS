//
//  RegisterController.swift
//  login-project
//
//  Created by Emmanuel Anene on 20/10/2024.
//

import UIKit

class RegisterController: UIViewController {
    
    let headerView = AuthHeaderView(title: "Sign Up", subtitle: "Create new account")
    let username = CustomTextField(fieldType: .username)
    let email = CustomTextField(fieldType: .email)
    let password = CustomTextField(fieldType: .password)
    
    let signUpButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .med)
    let signInButton = CustomButton(title: "Already have an account? Log in", hasBackground: false, fontSize: .small)



    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.setupUI()
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    

    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(username)
        self.view.addSubview(email)
        self.view.addSubview(password)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)
        
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.username.translatesAutoresizingMaskIntoConstraints = false
        self.email.translatesAutoresizingMaskIntoConstraints = false
        self.password.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            
            self.username.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 12),
            self.username.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.username.heightAnchor.constraint(equalToConstant: 55),
            self.username.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            
            self.email.topAnchor.constraint(equalTo: self.username.bottomAnchor, constant: 12),
            self.email.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.email.heightAnchor.constraint(equalToConstant: 55),
            self.email.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            
            self.password.topAnchor.constraint(equalTo: self.email.bottomAnchor, constant: 12),
            self.password.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.password.heightAnchor.constraint(equalToConstant: 55),
            self.password.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            
            
            
            self.signUpButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            
            self.signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    @objc private func didTapSignUp() {
        let registerUserRequest = RegisterUserRequest(
            username: self.username.text ?? "",
            email: self.email.text ?? "",
            password: self.password.text ?? ""
        )
        
        if !Validator.isValidUsername(with: registerUserRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        if !Validator.isValidPassword(with: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        
        
        AuthService.shared.registerUser(with: registerUserRequest) {
            [weak self] wasRegistered, error in
            
            guard let self = self else {return}
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                let vc = HomeController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }
    
    
    @objc private func didTapSignIn() {
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
