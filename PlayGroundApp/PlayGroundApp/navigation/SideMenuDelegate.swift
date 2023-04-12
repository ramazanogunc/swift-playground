//
//  SideMenuDelegate.swift
//  on-boarding
//
//  Created by Ramazan Öğünç on 11.04.2023.
//

import Foundation
import UIKit

protocol SideMenuDelegate: AnyObject {
    func menuButtonTapped()
    func itemSelected(item: ContentViewControllerPresentation)
}
