//
//  ListViewController.swift
//  ChatApp
//
//  Created by Eugene on 26/02/2024.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Canvas

import SwiftUI

struct ListViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().ignoresSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ListViewController()
        
        func makeUIViewController(context: Context) -> some ListViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
