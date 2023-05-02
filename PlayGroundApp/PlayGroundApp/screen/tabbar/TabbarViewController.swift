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
        title = "Flow Collection View Controller"
        setupTabbar()
    }
    
    private func setupTabbar() {
        viewControllers = [
            createNavController(for: FlowCollectionViewController(), title: NSLocalizedString("Flow", comment: ""), image: UIImage(systemName: "square.grid.3x3")!),
            createNavController(for: CompositionCollectionViewController(), title: NSLocalizedString("Composition List", comment: ""), image: UIImage(systemName: "list.bullet")!)
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
