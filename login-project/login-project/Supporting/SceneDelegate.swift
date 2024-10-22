//
//  SceneDelegate.swift
//  login-project
//
//  Created by Emmanuel Anene on 17/10/2024.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        self.setupWindow(with: scene)
        self.checkAuthentication()
    }
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        window.makeKeyAndVisible()
        self.window = window
    }
    
    public func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            self.goToController(with: LoginController())
        }
        else {
            self.goToController(with: HomeController())
        }
    }
    
    private func goToController(with vc: UIViewController) {
        DispatchQueue.main.async {
            [weak self] in
            
            UIView.animate(withDuration: 0.25, animations: {
                self?.window?.layer.opacity = 0
            }, completion: { [weak self] _ in
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav
                
                UIView.animate(withDuration: 0.25) {
                    self?.window?.layer.opacity = 1
                }
            })
            
            
        }
    }

    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

