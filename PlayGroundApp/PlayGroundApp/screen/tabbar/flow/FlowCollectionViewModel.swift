//
//  FlowCollectionViewModel.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 1.05.2023.
//

import Foundation


class FlowCollectionViewModel: BaseViewModel {
    
    let options : [String] = (1...8).map({ return "\($0)"})
    var columnSize: Double = 3
    
    
}
