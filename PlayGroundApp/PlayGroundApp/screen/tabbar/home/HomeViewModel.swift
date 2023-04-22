//
//  HomeViewModel.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    private var page : Int = 0
    private var isLastPage: Bool = false
    
    
    var updateTableView: (() -> Void)? = nil
    var emptyData: (() -> Void)? = nil
    
    
    var characters: [Character]  = []
    
    @objc func getData() {
        if isLastPage { return }
        page += 1
        
        showLoading?()
        isLoding = true
        client.request(for: GetAllCharactersRequest(query: query,page: page), result: { [weak self] result in
            self?.hideLoading?()
            self?.isLoding = false
            switch(result) {
            case .success(let data):
                self?.isLastPage = data.info.next == nil
                self?.characters.append(contentsOf: data.results)
                if self?.characters.isEmpty ?? true {
                    self?.emptyData?()
                } else {
                    self?.updateTableView?()
                }
            case.error(_):
                self?.isLastPage = true
                break
            }
            
        })
        
    }
    
    
    var timer: Timer?
    var isLoding = false
    var query: String = ""
    
    
    func search(_ query: String) {
        if isLoding {
            return
        }
        timer?.invalidate()
        
        if query.isEmpty {
            self.characters.removeAll()
            page = 1
            isLastPage = false
            self.query = query
            updateTableView?()
            getData()
            return
        }
        
        if query.count < 3 {
            return
        }
        self.characters.removeAll()
        page = 1
        isLastPage = false
        self.query = query
        updateTableView?()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.getData()
        }
        
    }
 }
