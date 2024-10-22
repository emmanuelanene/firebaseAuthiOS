//
//  HomeController.swift
//  login-project
//
//  Created by Emmanuel Anene on 17/10/2024.
//

import UIKit

class HomeController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        
        label.text = "Loading..."
        label.textColor = .label
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Logout", style: .plain, target: self, action: #selector(didTapLogout)
        )
        
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
            
    }

    
    @objc private func didTapLogout() {
        AuthService.shared.signOut{ [weak self] error in
            guard let self = self else {return}
            
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                let vc = LoginController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
