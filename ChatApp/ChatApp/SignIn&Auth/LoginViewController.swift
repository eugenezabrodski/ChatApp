//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Eugene on 26/02/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    let welcomeLabel = UILabel(text: "Welcome back!")
    
    let loginWithLabel = UILabel(text: "Login With")
    let orLabel = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let neddAnAccountLabel = UILabel(text: "Need an account?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, font: .avenir20(), isShadow: true, cornerRadius: 4)
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .mainBlack())
    let signInButton = UIButton(title: "Sign In", titleColor: .buttonRed(), backgroundColor: .white, cornerRadius: 4)
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleButton.customGoogleButton()
        setupUI()
    }
    
}

// MARK: - Setup UI

extension LoginViewController {
    private func setupUI() {
        welcomeLabel.font = .avenir26()
        
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubViews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubViews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubViews: [loginWithView, orLabel, emailStackView, passwordStackView, loginButton], axis: .vertical, spacing: 40)
        signInButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubViews: [neddAnAccountLabel, signInButton], axis: .horizontal, spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

// MARK: - Canvas

import SwiftUI

struct LoginViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().ignoresSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> some LoginViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}