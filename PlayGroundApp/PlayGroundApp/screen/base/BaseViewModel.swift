//
//  BaseViewModel.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 16.04.2023.
//

import Foundation

class BaseViewModel {
    
    var showLoading : (() -> Void)? = nil
    var hideLoading : (() -> Void)? = nil
    var showWarningToast: ((String) -> Void)? = nil
    
}
