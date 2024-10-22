//
//  AuthHeaderView.swift
//  login-project
//
//  Created by Emmanuel Anene on 17/10/2024.
//

import UIKit

class AuthHeaderView: UIView {
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.contentMode = .scaleAspectFit
        return iv
    } ()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    init(
        title: String,
        subtitle: String
    ) {
        self.titleLabel.text = title
        self.subTitleLabel.text = subtitle
        
        super.init(frame: .zero)
        self.setupUI()
    }
    
    
    
    // MARK: - UI Setup
    private func setupUI() {
        // Add subviews to the UIView in correct hierarchy
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        // Remove default constraints from subviews
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Custom Define Constraints
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 90),
            self.logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            self.titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 19),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
