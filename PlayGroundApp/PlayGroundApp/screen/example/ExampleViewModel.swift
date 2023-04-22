//
//  ExampleViewModel.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 17.04.2023.
//

import Foundation

class ExampleViewModel : BaseViewModel {
    
    func deneme() {
        self.showLoading?()
        client.request(for: DenemeRequest(), result: { [weak self] (result) in
            switch(result){
                case .success(let response):
                self?.hideLoading?()
                print("Success \(response)")
                case .error:
                self?.hideLoading?()
                    print("Error")
            }
        })
    }
}
