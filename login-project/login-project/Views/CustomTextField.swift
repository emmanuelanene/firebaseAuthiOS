//
//  CustomTextField.swift
//  login-project
//
//  Created by Emmanuel Anene on 17/10/2024.
//

import UIKit

class CustomTextField: UITextField {
    enum CustomTextFieldType {
        case username
        case email
        case password
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        
        super.init(frame: .zero)
        
        // Placeholder Setup
        switch fieldType {
            case .email:
                self.placeholder = "Email"
                self.keyboardType = .emailAddress
                self.textContentType = .emailAddress
                
            case .password:
                self.placeholder = "Password"
                self.textContentType = .oneTimeCode
                self.isSecureTextEntry = true
                
            case .username:
                self.placeholder = "Username"
        }
        
        // BG Color
        self.backgroundColor = .secondarySystemBackground
        
        // Corner Radius
        self.layer.cornerRadius = 10
        
        // Keyboard Layout Setup
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none

        // Start Padding within UITextField
        self.leftView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 12,
            height: self.frame.size.height
        ))
        self.leftViewMode = .always
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
