//
//  PeopleViewController.swift
//  ChatApp
//
//  Created by Eugene on 26/02/2024.
//

import UIKit
import FirebaseAuth

class PeopleViewController: UIViewController {
    
    //let users = Bundle.main.decode([MUser].self, from: "users.json")
    let users = [MUser]()
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, MUser>!
    enum Section: Int, CaseIterable {
        case user
        
        func description(userCount: Int) -> String {
            switch self {
            case .user:
                return "\(userCount) people nearby"
            }
        }
    }
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData(with: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(signOut))
    }
    
    // MARK: - Methods
    
    @objc private func signOut() {
        let ac = UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        ac.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            do {
                try Auth.auth().signOut()
                UIApplication.shared.keyWindow?.rootViewController = AuthViewController()
            } catch {
                print("erorrororororo")
            }
        }))
        present(ac, animated: true)
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseId)
    }
    
    private func createCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            guard let section = Section(rawValue: sectionIndex) else { fatalError("H") }
            
            switch section {
            case .user:
                return self.createUsersSection()
            }
        }
        let configure = UICollectionViewCompositionalLayoutConfiguration()
        configure.interSectionSpacing = 20
        layout.configuration = configure
        return layout
    }
    
    private func reloadData(with searchText: String?) {
        let filtered = users.filter { (user) -> Bool in
            user.contains(filter: searchText)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, MUser>()
        snapshot.appendSections([.user])
        snapshot.appendItems(filtered, toSection: .user)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 15, bottom: 0, trailing: 15)
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return sectionHeader
    }

}

extension PeopleViewController {
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MUser>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, user) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError() }
            switch section {
            case .user:
                return self.configure(collectionView: collectionView, cellType: UserCell.self, with: user, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else { fatalError() }
            guard let section = Section(rawValue: indexPath.section) else { fatalError() }
            let items = self.dataSource.snapshot().itemIdentifiers(inSection: .user)
            sectionHeader.configure(text: section.description(userCount: items.count), font: .systemFont(ofSize: 36, weight: .light), textColor: .darkGray)
            return sectionHeader
        }
    }
}

// MARK: - UISearchBarDelegate

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
    }
}

// MARK: - Canvas

import SwiftUI

struct PeopleViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().ignoresSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some MainTabBarController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
