//
//  UserCell.swift
//  ChatApp
//
//  Created by Eugene on 02/03/2024.
//

import UIKit

class UserCell: UICollectionViewCell, SelfConfiguringCell {
    
    let userImageView = UIImageView()
    let userName = UILabel(text: "text")
    let containerIVew = UIView()
    
    static var reuseId: String = "UserCell"
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userImageView.image = UIImage(named: user.avatarStringURL)
        userName.text = user.username
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
        
        self.layer.cornerRadius = 4
        self.layer.shadowColor = #colorLiteral(red: 0.5647058824, green: 0.568627451, blue: 0.5882352941, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerIVew.layer.cornerRadius = 4
        self.containerIVew.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        containerIVew.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerIVew)
        containerIVew.addSubview(userImageView)
        containerIVew.addSubview(userName)
        
        NSLayoutConstraint.activate([
            containerIVew.topAnchor.constraint(equalTo: self.topAnchor),
            containerIVew.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerIVew.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerIVew.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: containerIVew.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: containerIVew.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: containerIVew.trailingAnchor),
            userImageView.heightAnchor.constraint(equalTo: containerIVew.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            userName.leadingAnchor.constraint(equalTo: containerIVew.leadingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: containerIVew.trailingAnchor, constant: -8),
            userName.bottomAnchor.constraint(equalTo: containerIVew.bottomAnchor)
        ])
    }
    
}
