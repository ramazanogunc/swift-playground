//
//  HomeViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import UIKit

class RickAndMortyCharacterViewController: ContentViewController {
    
    private let viewModel = RickAndMortyCharacterViewModel()
    override var baseViewModel: BaseViewModel? {
        return viewModel
    }
    
    private lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(CharacterCell.self, forCellReuseIdentifier: "cell")
        tbl.separatorStyle = .none
        return tbl
    }()
    
    
    private lazy var search : UISearchController =  {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        search.searchBar.sizeToFit()
        search.obscuresBackgroundDuringPresentation = false
        search.hidesNavigationBarDuringPresentation = true
        self.definesPresentationContext = true
        search.searchBar.placeholder = "Search here"
        return search
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRightMenu(UIImage(systemName: "line.horizontal.3"))
        setupViews()
        
        viewModel.getData()
        viewModel.updateTableView = { [weak self] in
            self?.tableView.reloadData()

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }

}



// MARK: SETUP VIEWS
extension RickAndMortyCharacterViewController {
    
    private func setupViews() {
        title = "Characters"
        view.backgroundColor = .white
        self.navigationItem.searchController = search
        
        view.addSubview(tableView)
        tableView.topToSuperview(usingSafeArea: true)
        tableView.leadingToSuperview(usingSafeArea: true)
        tableView.trailingToSuperview(usingSafeArea: true)
        tableView.bottomToSuperview(usingSafeArea: true)
    }
    
}

// MARK: TABLE VIEW
extension RickAndMortyCharacterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharacterCell else {
            fatalError("Could not dequeue cell")
        }
        cell.data = viewModel.characters[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = self.viewModel.characters.count - 1
        if indexPath.row == lastItem {
            viewModel.getData()
        }
    }
    
    
}

// MARK: SEARCH BAR
extension RickAndMortyCharacterViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText)
    }
    
}
