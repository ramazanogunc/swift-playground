//
//  UIViewControllerExtensions.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 13.04.2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func changeNavigationBarColor(_ color: UIColor) {
        let appearance = UINavigationBarAppearance()
        let navigationBar = navigationController?.navigationBar
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        navigationBar?.standardAppearance = appearance;
        navigationBar?.scrollEdgeAppearance = navigationBar?.standardAppearance
    }
    
    func clearNavigationBarColor() {
        let appearance = UINavigationBarAppearance()
        let navigationBar = navigationController?.navigationBar
        appearance.backgroundColor = .clear
        navigationBar?.standardAppearance = appearance;
        navigationBar?.scrollEdgeAppearance = navigationBar?.standardAppearance
    }
}
