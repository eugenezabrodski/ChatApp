//
//  MainTabBarController.swift
//  ChatApp
//
//  Created by Eugene on 26/02/2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        
        let listVC = ListViewController()
        let peopleVC = PeopleViewController()
        
        let boldCongif = UIImage.SymbolConfiguration(weight: .medium)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldCongif)
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldCongif)
        
        viewControllers = [
            generateNavigationController(rootViewController: peopleVC, title: "People", image: conversationImage!),
            generateNavigationController(rootViewController: listVC, title: "Conversation", image: conversationImage!)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
        
    }
    
}
