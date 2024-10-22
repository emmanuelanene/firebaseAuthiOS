//
//  CustomButton.swift
//  login-project
//
//  Created by Emmanuel Anene on 17/10/2024.
//

import UIKit

class CustomButton: UIButton {
    enum FontSize {
        case big
        case med
        case small
    }
    
    init(
        title: String,
        hasBackground: Bool = false,
        fontSize: FontSize
    ) {
        
        super.init(frame: .zero)
        
        // Button Text
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        
        // Button BG Color
        self.backgroundColor = hasBackground ? .systemBlue : .clear
        
        
        // Button Title Color
        let titleColor: UIColor = hasBackground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        
        // Button Text Font Size
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
