//
//  TabbarViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 20.04.2023.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearNavigationBarColor()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }

}

// MARK: SETUP VIEWS
extension TabbarViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        setupTabbar()
    }
    
    private func setupTabbar() {
        viewControllers = [
            createNavController(for: UIViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: UIViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!)
        ]
    }
    
    
    private func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
}
