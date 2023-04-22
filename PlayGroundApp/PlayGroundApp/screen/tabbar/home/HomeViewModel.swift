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
    
    
    var listData: (() -> Void)? = nil
    var emptyData: (() -> Void)? = nil
    
    
    var characters: [Character]  = []
    
    func getData() {
        if isLastPage { return }
        page += 1
        
        showLoading?()
        client.request(for: GetAllCharactersRequest(page: page), result: { [weak self] result in
            self?.hideLoading?()
            switch(result) {
            case .success(let data):
                self?.isLastPage = data.info.next == nil
                self?.characters.append(contentsOf: data.results)
                if self?.characters.isEmpty ?? true {
                    self?.emptyData?()
                } else {
                    self?.listData?()
                }
            case.error(_): break
            }
            
        })
        
    }
}
