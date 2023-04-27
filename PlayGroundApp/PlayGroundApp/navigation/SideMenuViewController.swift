//
//  SideMenuViewController.swift
//  on-boarding
//
//  Created by Ramazan Öğünç on 11.04.2023.
//

import Foundation
import UIKit

final class SideMenuViewController: UIViewController {
    private var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private var labelHeader: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .darkText
        view.text = "Ramo Playground Menu"
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()

    private var sideMenuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let widthRate = 0.65

    private var sideMenuItems: [SideMenuItem] = [
        
        SideMenuItem(icon: UIImage(systemName: "slider.horizontal.below.square.filled.and.square"), name: "Slider", viewController: ContentViewControllerPresentation.embed(SliderViewController())),
        SideMenuItem(icon: UIImage(systemName: "menucard"), name: "Tabbar", viewController: ContentViewControllerPresentation.embed(TabbarViewController())),
        SideMenuItem(icon: UIImage(systemName: "pencil.line"), name: "Example", viewController: ContentViewControllerPresentation.embed(ExampleViewController())),
        SideMenuItem(icon: UIImage(systemName: "person"), name: "Ricky And Morty", viewController: ContentViewControllerPresentation.embed(RickAndMortyCharacterViewController())),
        SideMenuItem(icon: UIImage(systemName: "list.bullet.clipboard"), name: "Todo", viewController: ContentViewControllerPresentation.embed(TodoViewController()))
    ]
    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    private var shadowColor: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0.5)
    weak var delegate: SideMenuDelegate?
    
    convenience init(sideMenuItems: [SideMenuItem]) {
        self.init()
        self.sideMenuItems = sideMenuItems
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func show() {
        self.view.frame.origin.x = 0
        self.view.backgroundColor = self.shadowColor
        UIView.animate(withDuration: 0.5) {
            self.trailingConstraint.constant = 0
//            self.leadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    func hide() {
        let screenSize: CGRect = UIScreen.main.bounds
        self.view.backgroundColor = .clear
        UIView.animate(withDuration: 0.5) {
            self.trailingConstraint.constant = screenSize.width
//            self.leadingConstraint.constant = -screenSize.width
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.view.frame.origin.x = screenSize.width
        }
    }
    
    private func configureView() {
        view.backgroundColor = .clear
        view.frame.origin.x = UIScreen.main.bounds.width

        addSubviews()
        configureTableView()
        configureTapGesture()
    }

    private func addSubviews() {
        view.addSubview(sideMenuView)
        sideMenuView.addSubview(headerView)
        headerView.addSubview(labelHeader)
        sideMenuView.addSubview(tableView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        sideMenuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        leadingConstraint = sideMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -view.frame.size.width)
//        leadingConstraint.isActive = true
        trailingConstraint = sideMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.frame.size.width)
        trailingConstraint.isActive = true
        sideMenuView.widthAnchor.constraint(equalToConstant: view.frame.size.width * widthRate).isActive = true
        sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        headerView.topAnchor.constraint(equalTo: sideMenuView.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        labelHeader.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20).isActive = true
        labelHeader.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true

        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: sideMenuView.bottomAnchor).isActive = true
    }

    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = false
        tableView.register(SideMenuItemCell.self, forCellReuseIdentifier: SideMenuItemCell.identifier)
    }

    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped() {
        hide()
    }
}

extension SideMenuViewController: UIGestureRecognizerDelegate {
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else { return false }
        if view === headerView || view.isDescendant(of: tableView) {
            return false
        }
        return true
    }
}

extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sideMenuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuItemCell.identifier, for: indexPath) as? SideMenuItemCell else {
            fatalError("Could not dequeue cell")
        }
        let item = sideMenuItems[indexPath.row]
        cell.configureCell(icon: item.icon, text: item.name)
        cell.backgroundColor = .white
        cell.contentView.backgroundColor = .white
//        cell.contentView.frame.backgroundColor = .white
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let item = sideMenuItems[indexPath.row]
        delegate?.itemSelected(item: item.viewController)
    }
}
