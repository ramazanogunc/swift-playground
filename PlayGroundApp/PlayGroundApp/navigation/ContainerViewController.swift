//
//  ContainerViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 11.04.2023.
//

import UIKit

final class ContainerViewController: UIViewController {
    private var sideMenuViewController: SideMenuViewController
    private var navigator: UINavigationController? = nil
    private var rootViewController: UIViewController {
        didSet {
            if var vc = rootViewController as? ContentViewControllerProtocol {
                vc.delegate = self
            }
            navigator?.setViewControllers([rootViewController], animated: false)
        }
    }


    init(sideMenuViewController: SideMenuViewController, rootViewController: ContentViewController) {
        self.sideMenuViewController = sideMenuViewController
        self.rootViewController = rootViewController
        self.navigator = UINavigationController(rootViewController: rootViewController)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        addChildViewControllers()
        configureDelegates()
        configureGestures()
    }

    private func configureDelegates() {
        sideMenuViewController.delegate = self
        if var vc = rootViewController as? ContentViewControllerProtocol {
            vc.delegate = self
        }
    }

    private func configureGestures() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeftGesture.direction = .left
        swipeLeftGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeLeftGesture)

        let rightSwipeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(swipedRight))
        rightSwipeGesture.cancelsTouchesInView = false
        rightSwipeGesture.edges = .left
        view.addGestureRecognizer(rightSwipeGesture)
    }

    @objc private func swipedLeft() {
        sideMenuViewController.hide()
    }

    @objc private func swipedRight() {
        sideMenuViewController.show()
    }

    func updateRootViewController(_ viewController: UIViewController) {
        rootViewController = viewController
    }

    private func addChildViewControllers() {
        guard let navigator = self.navigator else {return}
        addChild(navigator)
        view.addSubview(navigator.view)
        navigator.didMove(toParent: self)

        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        sideMenuViewController.didMove(toParent: self)
    }
}

extension ContainerViewController: SideMenuDelegate {
    func menuButtonTapped() {
        sideMenuViewController.show()
    }

    func itemSelected(item: ContentViewControllerPresentation) {
        switch item {
        case let .embed(viewController):
            updateRootViewController(viewController)
            sideMenuViewController.hide()
        case let .push(viewController):
            sideMenuViewController.hide()
            navigator?.pushViewController(viewController, animated: true)
        case let .modal(viewController):
            sideMenuViewController.hide()
            navigator?.present(viewController, animated: true, completion: nil)
        }
    }
}
